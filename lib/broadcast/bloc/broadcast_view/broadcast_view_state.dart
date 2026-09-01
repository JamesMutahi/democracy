part of 'broadcast_view_cubit.dart';

enum BroadcastView { fullscreen, minimized }

class BroadcastViewState {
  final BroadcastView view;
  final Broadcast? broadcast;

  BroadcastViewState({this.view = BroadcastView.fullscreen, this.broadcast});
}
