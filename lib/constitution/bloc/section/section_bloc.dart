import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:democracy/app/bloc/services/websocket_service.dart';
import 'package:democracy/constitution/models/section.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'section_event.dart';
part 'section_state.dart';
part 'section_bloc.freezed.dart';

const String stream = 'constitution';

class SectionBloc extends Bloc<SectionEvent, SectionState> {
  SectionBloc({required this.webSocketService}) : super(const SectionState()) {
    _subscription = webSocketService.messages.listen((message) {
      if (message['stream'] == stream) {
        switch (message['payload']['action']) {
          case 'retrieve':
            add(_Loaded(payload: message['payload']));
        }
      }
    });
    on<_Load>((event, emit) => _onLoad(event, emit));
    on<_Loaded>((event, emit) => _onLoaded(event, emit));
    on<_Updated>((event, emit) => _onUpdated(event, emit));
  }

  void _onLoad(_Load event, Emitter<SectionState> emit) async {
    emit(
      state.copyWith(status: SectionStatus.loading, sectionId: event.sectionId),
    );
    if (!webSocketService.isConnected) {
      emit(state.copyWith(status: SectionStatus.failure));
      return;
    }

    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        'action': 'retrieve',
        'request_id': event.sectionId,
        'pk': event.sectionId,
      },
    };
    webSocketService.send(message);
  }

  void _onLoaded(_Loaded event, Emitter<SectionState> emit) async {
    emit(state.copyWith(status: SectionStatus.loading));
    if (event.payload['response_status'] == 200) {
      final section = Section.fromJson(event.payload['data']);
      emit(
        state.copyWith(
          status: SectionStatus.success,
          section: section,
          sectionId: event.payload['request_id'],
        ),
      );
    } else {
      emit(state.copyWith(status: SectionStatus.failure));
    }
  }

  void _onUpdated(_Updated event, Emitter<SectionState> emit) async {
    emit(state.copyWith(status: SectionStatus.loading));
    emit(
      state.copyWith(
        status: SectionStatus.success,
        section: event.section,
        sectionId: event.section.id,
      ),
    );
  }

  @override
  Future<void> close() async {
    await _subscription.cancel();
    await super.close();
  }

  late StreamSubscription _subscription;
  final WebSocketService webSocketService;
}
