import 'package:bloc/bloc.dart';
import 'package:stream_transform/stream_transform.dart';

EventTransformer<Event> debounce<Event>() {
  return (events, mapper) =>
      events.debounce(Duration(milliseconds: 300)).switchMap(mapper);
}
