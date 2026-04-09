import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:democracy/app/bloc/websocket/websocket_service.dart';
import 'package:democracy/app/shared/constants/strings.dart';
import 'package:democracy/constitution/models/section.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'section_detail_bloc.freezed.dart';
part 'section_detail_state.dart';
part 'section_detail_event.dart';

const String stream = 'constitution';
const String requestId = 'constitution';

class SectionDetailBloc extends Bloc<SectionDetailEvent, SectionDetailState> {
  SectionDetailBloc({required this.webSocketService})
    : super(const SectionDetailState.initial()) {
    _subscription = webSocketService.messages.listen((message) {
      if (message['stream'] == stream) {
        switch (message['payload']['action']) {
          case 'retrieve':
            add(_Loaded(payload: message['payload']));
          case 'bookmark':
            add(_Bookmarked(payload: message['payload']));
        }
      }
    });
    on<_Load>((event, emit) => _onLoad(event, emit));
    on<_Loaded>((event, emit) => _onLoaded(event, emit));
    on<_Bookmark>((event, emit) => _onBookmark(event, emit));
    on<_Bookmarked>((event, emit) => _onBookmarked(event, emit));
  }

  void _onLoad(_Load event, Emitter<SectionDetailState> emit) {
    emit(_Loading());
    if (!webSocketService.isConnected) {
      emit(SectionDetailFailure(error: serverError));
      return;
    }

    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        'action': 'retrieve',
        'request_id': requestId,
        'tag': event.tag,
      },
    };
    webSocketService.send(message);
  }

  void _onLoaded(_Loaded event, Emitter<SectionDetailState> emit) {
    emit(_Loading());
    if (event.payload['response_status'] == 200) {
      Section section = Section.fromJson(event.payload['data']);
      emit(SectionLoaded(section: section));
    } else {
      emit(SectionDetailFailure(error: event.payload['errors'].toString()));
    }
  }

  void _onBookmark(_Bookmark event, Emitter<SectionDetailState> emit) {
    emit(_Loading());
    if (!webSocketService.isConnected) {
      emit(SectionDetailFailure(error: serverError));
      return;
    }

    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        'action': 'bookmark',
        'request_id': requestId,
        'pk': event.section.id,
      },
    };
    webSocketService.send(message);
  }

  void _onBookmarked(_Bookmarked event, Emitter<SectionDetailState> emit) {
    emit(_Loading());
    if (event.payload['response_status'] == 200) {
      Section section = Section.fromJson(event.payload['data']);
      emit(SectionBookmarked(section: section));
    } else {
      emit(SectionDetailFailure(error: event.payload['errors'].toString()));
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
