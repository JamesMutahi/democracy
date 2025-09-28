import 'package:bloc/bloc.dart';
import 'package:democracy/app/bloc/websocket/websocket_service.dart';
import 'package:democracy/constitution/models/section.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sections_bloc.freezed.dart';
part 'sections_state.dart';
part 'sections_event.dart';

const String stream = 'constitution';
const String requestId = 'constitution';
const String action = 'tags';

class SectionsBloc extends Bloc<SectionsEvent, SectionsState> {
  SectionsBloc({required this.webSocketService})
    : super(const SectionsState.initial()) {
    webSocketService.messages.listen((message) {
      if (message['stream'] == stream &&
          message['payload']['action'] == action) {
        add(_Received(payload: message['payload']));
      }
    });
    on<_Get>((event, emit) {
      _onGet(event, emit);
    });
    on<_Received>((event, emit) {
      _onReceived(event, emit);
    });
  }

  Future _onGet(_Get event, Emitter<SectionsState> emit) async {
    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        "action": action,
        "request_id": requestId,
        'search_term': event.searchTerm,
      },
    };
    webSocketService.send(message);
  }

  Future _onReceived(_Received event, Emitter<SectionsState> emit) async {
    emit(SectionsState.loading());
    if (event.payload['response_status'] == 200) {
      final List<Section> sections = List.from(
        event.payload['data'].map((e) => Section.fromJson(e)),
      );
      emit(SectionsState.loaded(sections: sections));
    } else {
      emit(SectionsState.failure());
    }
  }

  final WebSocketService webSocketService;
}
