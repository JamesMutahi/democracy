part of 'websocket_bloc.dart';

@freezed
abstract class WebsocketEvent with _$WebsocketEvent {
  const factory WebsocketEvent.connect() = _Connect;

  const factory WebsocketEvent.changeState({required WebsocketState state}) =
      _ChangeState;

  const factory WebsocketEvent.getConstitution() = _GetConstitution;

  const factory WebsocketEvent.getConstitutionTags({String? searchTerm}) =
      _GetConstitutionTags;

  const factory WebsocketEvent.bookmarkSection({required Section section}) =
      _BookmarkSection;

  const factory WebsocketEvent.disconnect() = _Disconnect;
}
