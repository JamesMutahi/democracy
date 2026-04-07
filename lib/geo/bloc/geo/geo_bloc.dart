import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:democracy/app/bloc/websocket/websocket_service.dart';
import 'package:democracy/geo/models/constituency.dart';
import 'package:democracy/geo/models/county.dart';
import 'package:democracy/geo/models/ward.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'geo_event.dart';
part 'geo_state.dart';
part 'geo_bloc.freezed.dart';

const String stream = 'geo';

class GeoBloc extends Bloc<GeoEvent, GeoState> {
  GeoBloc({required this.webSocketService}) : super(GeoState()) {
    _subscription = webSocketService.messages.listen((message) {
      if (message['stream'] == stream) {
        if (message['payload']['action'] == 'counties') {
          add(_ReceivedCounties(payload: message['payload']));
        }
        if (message['payload']['action'] == 'constituencies') {
          add(_ReceivedConstituencies(payload: message['payload']));
        }
        if (message['payload']['action'] == 'wards') {
          add(_ReceivedWards(payload: message['payload']));
        }
      }
    });
    on<_Started>((event, emit) {
      emit(GeoState());
    });
    on<_GetCounties>((event, emit) {
      _onGetCounties(event, emit);
    });
    on<_GetConstituencies>((event, emit) {
      _onGetConstituencies(event, emit);
    });
    on<_GetWards>((event, emit) {
      _onGetWards(event, emit);
    });
    on<_ReceivedCounties>((event, emit) {
      _onReceivedCounties(event, emit);
    });
    on<_ReceivedConstituencies>((event, emit) {
      _onReceivedConstituencies(event, emit);
    });
    on<_ReceivedWards>((event, emit) {
      _onReceivedWards(event, emit);
    });
  }

  void _onGetCounties(_GetCounties event, Emitter<GeoState> emit) {
    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {'action': 'counties'},
    };
    webSocketService.send(message);
  }

  void _onGetConstituencies(
    _GetConstituencies event,
    Emitter<GeoState> emit,
  ) {
    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {'action': 'constituencies', 'county': event.county.id},
    };
    webSocketService.send(message);
  }

  void _onGetWards(_GetWards event, Emitter<GeoState> emit) {
    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {'action': 'wards', 'constituency': event.constituency.id},
    };
    webSocketService.send(message);
  }

  void _onReceivedCounties(
    _ReceivedCounties event,
    Emitter<GeoState> emit,
  ) {
    emit(GeoState(status: GeoStatus.loading));
    if (event.payload['response_status'] == 200) {
      final List<County> counties = List.from(
        event.payload['data'].map((e) => County.fromJson(e)),
      );
      emit(state.copyWith(status: GeoStatus.success, counties: counties));
    } else {
      emit(state.copyWith(status: GeoStatus.failure));
    }
  }

  void _onReceivedConstituencies(
    _ReceivedConstituencies event,
    Emitter<GeoState> emit,
  ) {
    emit(state.copyWith(status: GeoStatus.loading));
    if (event.payload['response_status'] == 200) {
      final List<Constituency> constituencies = List.from(
        event.payload['data'].map((e) => Constituency.fromJson(e)),
      );
      emit(
        state.copyWith(
          status: GeoStatus.success,
          constituencies: constituencies,
          wards: [],
        ),
      );
    } else {
      emit(state.copyWith(status: GeoStatus.failure));
    }
  }

  void _onReceivedWards(_ReceivedWards event, Emitter<GeoState> emit) {
    emit(state.copyWith(status: GeoStatus.loading));
    if (event.payload['response_status'] == 200) {
      final List<Ward> wards = List.from(
        event.payload['data'].map((e) => Ward.fromJson(e)),
      );
      emit(state.copyWith(status: GeoStatus.success, wards: wards));
    } else {
      emit(state.copyWith(status: GeoStatus.failure));
    }
  }

  @override
  Future<void> close() async {
    await _subscription.cancel();
    await super.close();
  }

  late StreamSubscription _subscription;
  final WebSocketService webSocketService;
}
