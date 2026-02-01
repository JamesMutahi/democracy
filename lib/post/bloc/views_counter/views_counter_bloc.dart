import 'package:bloc/bloc.dart';
import 'package:democracy/app/bloc/websocket/websocket_service.dart';
import 'package:democracy/post/models/post.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'views_counter_event.dart';
part 'views_counter_state.dart';
part 'views_counter_bloc.freezed.dart';

const String stream = 'posts';
const String requestId = 'posts';

class ViewsCounterBloc extends Bloc<ViewsCounterEvent, ViewsCounterState> {
  ViewsCounterBloc({required this.webSocketService})
    : super(const ViewsCounterState()) {
    webSocketService.messages.listen((message) {
      if (message['stream'] == stream) {
        switch (message['payload']['action']) {
          case 'add_view':
            break;
        }
      }
    });
    on<_Viewed>((event, emit) {
      _onViewed(event, emit);
    });
  }

  Future _onViewed(_Viewed event, Emitter<ViewsCounterState> emit) async {
    if (!state.postIds.contains(event.post.id)) {
      emit(
        state.copyWith(
          status: ViewsCounterStatus.success,
          postIds: [
            ...state.postIds,
            ...[event.post.id],
          ],
        ),
      );
      Map<String, dynamic> message = {
        'stream': stream,
        'payload': {
          "action": 'add_view',
          "request_id": requestId,
          'pk': event.post.id,
        },
      };
      webSocketService.send(message);
    }
  }

  final WebSocketService webSocketService;
}
