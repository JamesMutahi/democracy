import 'package:bloc/bloc.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';

EventTransformer<E> throttleDroppable<E>({required Duration duration}) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}
