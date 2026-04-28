import 'package:bloc/bloc.dart';
import 'package:democracy/app/bloc/repository/api_repository.dart';
import 'package:democracy/ballot/models/ballot.dart';
import 'package:democracy/chat/models/chat.dart';
import 'package:democracy/chat/models/message.dart';
import 'package:democracy/constitution/models/section.dart';
import 'package:democracy/meet/models/meeting.dart';
import 'package:democracy/petition/models/petition.dart';
import 'package:democracy/post/models/post.dart';
import 'package:democracy/survey/models/survey.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';

part 'message_create_event.dart';
part 'message_create_state.dart';
part 'message_create_bloc.freezed.dart';

class MessageCreateBloc extends Bloc<MessageCreateEvent, MessageCreateState> {
  MessageCreateBloc({required this.apiRepository})
    : super(const MessageCreateState()) {
    on<_Create>((event, emit) async => await _onCreate(event, emit));
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

  MessageCreateEvent? _previousEvent;

  @override
  void onEvent(MessageCreateEvent event) {
    if (event is! _Retry) {
      _previousEvent = event;
    }
    super.onEvent(event);
  }

  Future _onCreate(_Create event, Emitter<MessageCreateState> emit) async {
    emit(MessageCreateState(status: MessageCreateStatus.loading));
    try {
      final data = await apiRepository.createMessage(
        chat: event.chat,
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
      final Message message = Message.fromJson(data['message']);
      if (message.assets.isNotEmpty) {
        emit(state.copyWith(message: message));
        add(_UploadAssets(uploads: data['uploads']));
      } else {
        emit(
          state.copyWith(status: MessageCreateStatus.success, message: message),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          status: MessageCreateStatus.failure,
          error: e.toString(),
        ),
      );
    }
  }

  Future _onUploadAssets(
    _UploadAssets event,
    Emitter<MessageCreateState> emit,
  ) async {
    emit(state.copyWith(status: MessageCreateStatus.loading));
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

            int assetNumber = currentAssetIndex + 1;
            emit(
              state.copyWith(
                progress:
                    "Uploading asset $assetNumber of $totalAssets: ${totalProgressPercent.toStringAsFixed(0)}%",
              ),
            );
          },
        );
      }

      final assets = await apiRepository.messageAssetUploadComplete(
        assetIdList: assetIdList,
      );

      emit(
        state.copyWith(
          status: MessageCreateStatus.success,
          message: state.message?.copyWith(assets: assets),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: MessageCreateStatus.failure,
          error: e.toString(),
        ),
      );
    }
  }

  final APIRepository apiRepository;
}
