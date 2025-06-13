part of 'post_bloc.dart';

@freezed
class PostEvent with _$PostEvent {
  const factory PostEvent.initialize() = _Initialize;
  const factory PostEvent.changeState({required PostState state}) =
      _ChangeState;
}
