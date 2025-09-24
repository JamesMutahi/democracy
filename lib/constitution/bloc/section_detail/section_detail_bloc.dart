import 'package:bloc/bloc.dart';
import 'package:democracy/app/bloc/websocket/websocket_service.dart';
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
    webSocketService.messages.listen((message) {
      if (message['stream'] == stream) {
        switch (message['payload']['action']) {
          case 'create':
            add(_Created(payload: message['payload']));
          case 'update':
            add(_Updated(payload: message['payload']));
          case 'delete':
            add(_Deleted(payload: message['payload']));
        }
      }
    });
    on<_Created>((event, emit) {
      _onCreated(event, emit);
    });
    on<_Updated>((event, emit) {
      _onUpdated(event, emit);
    });
    on<_Deleted>((event, emit) {
      _onDeleted(event, emit);
    });
    on<_Bookmark>((event, emit) {
      _onBookmark(event, emit);
    });
  }

  Future _onCreated(_Created event, Emitter<SectionDetailState> emit) async {
    emit(_Loading());
    if (event.payload['response_status'] == 200) {
      Section section = Section.fromJson(event.payload['data']);
      emit(SectionLoaded(section: section));
    } else {
      emit(SectionDetailFailure(error: event.payload['errors'][0]));
    }
  }

  Future _onUpdated(_Updated event, Emitter<SectionDetailState> emit) async {
    emit(_Loading());
    if (event.payload['response_status'] == 200) {
      Section section = Section.fromJson(event.payload['data']);
      emit(SectionUpdated(section: section));
    } else {
      emit(SectionDetailFailure(error: event.payload['errors'][0]));
    }
  }

  Future _onDeleted(_Deleted event, Emitter<SectionDetailState> emit) async {
    emit(_Loading());
    if (event.payload['response_status'] == 204) {
      emit(SectionDeleted(sectionId: event.payload['pk']));
    } else {
      emit(SectionDetailFailure(error: event.payload['errors'][0]));
    }
  }

  Future _onBookmark(_Bookmark event, Emitter<SectionDetailState> emit) async {
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

  final WebSocketService webSocketService;
}
