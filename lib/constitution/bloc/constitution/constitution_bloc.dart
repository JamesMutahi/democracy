import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:democracy/app/bloc/websocket/websocket_service.dart';
import 'package:democracy/constitution/models/section.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'constitution_bloc.freezed.dart';
part 'constitution_state.dart';
part 'constitution_event.dart';

const String stream = 'constitution';
const String requestId = 'constitution';
const String action = 'list';

class ConstitutionBloc extends Bloc<ConstitutionEvent, ConstitutionState> {
  ConstitutionBloc({required this.webSocketService})
    : super(ConstitutionState.initial()) {
    _subscription = webSocketService.messages.listen((message) {
      if (message['stream'] == stream &&
          message['payload']['action'] == action) {
        add(_Received(payload: message['payload']));
      }
    });
    on<_Get>((event, emit) => _onGet(event, emit));
    on<_Received>((event, emit) => _onReceived(event, emit));
  }

  Future _onGet(_Get event, Emitter<ConstitutionState> emit) async {
    if (state is ConstitutionLoaded) {
      return;
    }

    emit(ConstitutionState.loading());
    if (!webSocketService.isConnected) {
      emit(ConstitutionState.failure(error: 'Server connection lost'));
      return;
    }

    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {'action': 'list', 'request_id': requestId},
    };
    webSocketService.send(message);
  }

  Future _onReceived(_Received event, Emitter<ConstitutionState> emit) async {
    emit(ConstitutionState.loading());
    if (event.payload['response_status'] == 200) {
      final List<Section> sections = List.from(
        event.payload['data'].map((e) => Section.fromJson(e)),
      );
      emit(ConstitutionState.loaded(sections: sections));
    } else {
      emit(
        ConstitutionState.failure(error: event.payload['errors'].toString()),
      );
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
