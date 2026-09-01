import 'package:democracy/broadcast/models/broadcast.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'broadcast_view_state.dart';

class BroadcastViewCubit extends Cubit<BroadcastViewState> {
  BroadcastViewCubit() : super(BroadcastViewState());

  void minimized({required Broadcast broadcast}) {
    emit(
      BroadcastViewState(view: BroadcastView.minimized, broadcast: broadcast),
    );
  }

  void maximized() {
    emit(BroadcastViewState(view: BroadcastView.fullscreen));
  }
}
