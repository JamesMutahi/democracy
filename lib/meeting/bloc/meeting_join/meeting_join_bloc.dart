import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:bloc/bloc.dart';
import 'package:democracy/app/bloc/repository/api/api_repository.dart';
import 'package:democracy/meeting/models/meeting.dart';
import 'package:democracy/user/models/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'meeting_join_event.dart';
part 'meeting_join_state.dart';
part 'meeting_join_bloc.freezed.dart';

class MeetingJoinBloc extends Bloc<MeetingJoinEvent, MeetingJoinState> {
  MeetingJoinBloc({required this.apiRepository})
    : super(const MeetingJoinState.initial()) {
    on<_Join>((event, emit) async => await _onJoin(event, emit));
  }

  Future<void> _onJoin(_Join event, Emitter<MeetingJoinState> emit) async {
    emit(MeetingJoinLoading());
    try {
      final data = await apiRepository.getMeetingToken(meeting: event.meeting);
      await event.engine.joinChannel(
        token: data['token'],
        channelId: event.meeting.id.toString(),
        uid: event.user.id,
        options: ChannelMediaOptions(
          clientRoleType: event.meeting.id == event.user.id
              ? ClientRoleType.clientRoleBroadcaster
              : ClientRoleType.clientRoleAudience,
        ),
      );
      emit(MeetingJoinSuccess());
    } catch (e) {
      emit(MeetingJoinFailure(error: e.toString()));
    }
  }

  final APIRepository apiRepository;
}
