import 'package:bloc/bloc.dart';
import 'package:democracy/app/bloc/repository/api/api_repository.dart';
import 'package:democracy/ballot/models/ballot.dart';
import 'package:democracy/chat/models/chat.dart';
import 'package:democracy/constitution/models/section.dart';
import 'package:democracy/meeting/models/meeting.dart';
import 'package:democracy/petition/models/petition.dart';
import 'package:democracy/post/models/post.dart';
import 'package:democracy/survey/models/survey.dart';
import 'package:democracy/user/models/user.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';

part 'direct_message_event.dart';
part 'direct_message_state.dart';
part 'direct_message_bloc.freezed.dart';

class DirectMessageBloc extends Bloc<DirectMessageEvent, DirectMessageState> {
  DirectMessageBloc({required this.apiRepository})
    : super(const DirectMessageState()) {
    on<_Send>((event, emit) async => await _onSend(event, emit));
    on<_UploadAssets>(
      (event, emit) async => await _onUploadAssets(event, emit),
    );
    on<_Retry>((event, emit) {
      if (_previousEvent != null) {
        state.copyWith(error: '');
        add(_previousEvent!);
      }
    });
  }

  DirectMessageEvent? _previousEvent;

  @override
  void onEvent(DirectMessageEvent event) {
    if (event is! _Retry) {
      _previousEvent = event;
    }
    super.onEvent(event);
  }

  Future _onSend(_Send event, Emitter<DirectMessageState> emit) async {
    emit(DirectMessageState(status: DirectMessageStatus.uploadingMessages));
    try {
      final data = await apiRepository.createDirectMessage(
        users: event.users,
        text: event.text,
        post: event.post,
        ballot: event.ballot,
        survey: event.survey,
        petition: event.petition,
        meeting: event.meeting,
        section: event.section,
        filePaths: event.filePaths,
        location: event.location,
      );
      List<Chat> chats = List.from(data['chats'].map((e) => Chat.fromJson(e)));

      final uploads = data['uploads'];
      if (uploads.isNotEmpty) {
        emit(state.copyWith(chats: chats));
        add(_UploadAssets(uploads: uploads));
      } else {
        emit(state.copyWith(status: DirectMessageStatus.success, chats: chats));
      }
    } catch (e) {
      emit(
        state.copyWith(
          status: DirectMessageStatus.failure,
          error: e.toString(),
        ),
      );
    }
  }

  Future _onUploadAssets(
    _UploadAssets event,
    Emitter<DirectMessageState> emit,
  ) async {
    emit(state.copyWith(status: DirectMessageStatus.uploadingAssets));
    try {
      List<String> assetIdList = [];
      for (var upload in event.uploads) {
        assetIdList.add(upload['asset_id']);
        final int totalAssets = event.uploads.length;
        final int currentAssetIndex = event.uploads.indexOf(upload);

        await apiRepository.uploadMessageAsset(
          name: upload['name']!,
          url: upload['url']!,
          onSendProgress: (count, total) {
            double fileProgress = count / total;

            double overallFileContribution =
                (currentAssetIndex + fileProgress) / totalAssets;

            double totalProgressPercent = 10 + (overallFileContribution * 90);

            emit(
              state.copyWith(
                progress: "${totalProgressPercent.toStringAsFixed(0)}%",
              ),
            );
          },
        );
      }

      await apiRepository.messageAssetUploadComplete(assetIdList: assetIdList);

      emit(state.copyWith(status: DirectMessageStatus.success));
    } catch (e) {
      emit(
        state.copyWith(
          status: DirectMessageStatus.failure,
          error: e.toString(),
        ),
      );
    }
  }

  final APIRepository apiRepository;
}
