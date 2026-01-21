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
          case 'retrieve':
            add(_Loaded(payload: message['payload']));
          case 'bookmark':
            add(_Bookmarked(payload: message['payload']));
        }
      }
    });
    on<_Load>((event, emit) {
      _onLoad(event, emit);
    });
    on<_Loaded>((event, emit) {
      _onLoaded(event, emit);
    });
    on<_Bookmark>((event, emit) {
      _onBookmark(event, emit);
    });
    on<_Bookmarked>((event, emit) {
      _onBookmarked(event, emit);
    });
  }

  Future _onLoad(_Load event, Emitter<SectionDetailState> emit) async {
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

  Future _onLoaded(_Loaded event, Emitter<SectionDetailState> emit) async {
    emit(_Loading());
    if (event.payload['response_status'] == 200) {
      Section section = Section.fromJson(event.payload['data']);
      emit(SectionLoaded(section: section));
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

  Future _onBookmarked(
    _Bookmarked event,
    Emitter<SectionDetailState> emit,
  ) async {
    emit(_Loading());
    if (event.payload['response_status'] == 200) {
      Section section = Section.fromJson(event.payload['data']);
      emit(SectionBookmarked(section: section));
    } else {
      emit(SectionDetailFailure(error: event.payload['errors'][0]));
    }
  }

  final WebSocketService webSocketService;
}
