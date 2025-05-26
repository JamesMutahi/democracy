import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'connectivity_event.dart';
part 'connectivity_state.dart';
part 'connectivity_bloc.freezed.dart';

class ConnectivityBloc extends Bloc<ConnectivityEvent, ConnectivityState> {
  ConnectivityBloc() : super(const ConnectivityInitial()) {
    on<_ListenConnection>((event, emit) async {
      await _onListenConnection(event, emit);
    });
    on<_ChangeConnection>((event, emit) => emit(event.status));
  }

  Future _onListenConnection(
    _ListenConnection event,
    Emitter<ConnectivityState> emit,
  ) async {
    try {
      _connectivitySubscription = Connectivity()
          .onConnectivityChanged
          .listen((List<ConnectivityResult> result) async {
        if (result.contains(ConnectivityResult.none)) {
          add(const _ChangeConnection(ConnectivityFailure()));
        } else {
          final connectivityResult = await (Connectivity().checkConnectivity());
          if (connectivityResult.contains(ConnectivityResult.none)) {
            add(const _ChangeConnection(ConnectivityFailure()));
          } else {
            final dio = Dio();
            Response response = await dio.get('http://example.com');
            if (response.statusCode == 200) {
              add(const _ChangeConnection(ConnectivitySuccess()));
            } else {
              add(const _ChangeConnection(ConnectivityFailure()));
            }
          }
        }
      });
    } catch (e) {
      add(const _ChangeConnection(ConnectivityFailure()));
    }
  }

  @override
  Future<void> close() {
    _connectivitySubscription.cancel();
    return super.close();
  }

  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;
}
