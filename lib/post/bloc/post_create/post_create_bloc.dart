import 'package:bloc/bloc.dart';
import 'package:democracy/app/bloc/repository/api_repository.dart';
import 'package:democracy/auth/bloc/auth/auth_bloc.dart';
import 'package:democracy/ballot/models/ballot.dart';
import 'package:democracy/constitution/models/section.dart';
import 'package:democracy/meet/models/meeting.dart';
import 'package:democracy/petition/models/petition.dart';
import 'package:democracy/post/models/post.dart';
import 'package:democracy/survey/models/survey.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';

part 'post_create_event.dart';
part 'post_create_state.dart';
part 'post_create_bloc.freezed.dart';

class PostCreateBloc extends Bloc<PostCreateEvent, PostCreateState> {
  PostCreateBloc({required this.authRepository, required this.apiRepository})
    : super(const PostCreateState()) {
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

  PostCreateEvent? _previousEvent;

  @override
  void onEvent(PostCreateEvent event) {
    if (event is! _Retry) {
      _previousEvent = event;
    }
    super.onEvent(event);
  }

  Future _onCreate(_Create event, Emitter<PostCreateState> emit) async {
    emit(PostCreateState(status: PostCreateStatus.uploadingPost));
    try {
      String? token = await authRepository.getToken();
      final data = await apiRepository.createPost(
        token: token!,
        body: event.body,
        status: event.status,
        repostOf: event.repostOf,
        replyTo: event.replyTo,
        communityNoteOf: event.communityNoteOf,
        ballot: event.ballot,
        survey: event.survey,
        petition: event.petition,
        meeting: event.meeting,
        section: event.section,
        tags: event.tags,
        filePaths: event.filePaths,
        location: event.location,
      );
      final Post post = Post.fromJson(data['post']);
      if (post.assets.isNotEmpty) {
        emit(state.copyWith(post: post));
        add(PostCreateEvent.uploadAssets(uploads: data['uploads']));
      } else {
        emit(state.copyWith(status: PostCreateStatus.success, post: post));
      }
    } catch (e) {
      emit(
        state.copyWith(status: PostCreateStatus.failure, error: e.toString()),
      );
    }
  }

  Future _onUploadAssets(
    _UploadAssets event,
    Emitter<PostCreateState> emit,
  ) async {
    emit(state.copyWith(status: PostCreateStatus.uploadingAssets));
    try {
      List<String> assetIdList = [];
      for (var upload in event.uploads) {
        assetIdList.add(upload['asset_id']);
        final int totalAssets = event.uploads.length;
        final int currentAssetIndex = event.uploads.indexOf(upload);

        await apiRepository.uploadAsset(
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

      String? token = await authRepository.getToken();
      await apiRepository.assetUploadComplete(
        token: token!,
        assetIdList: assetIdList,
      );

      emit(state.copyWith(status: PostCreateStatus.success));
    } catch (e) {
      emit(
        state.copyWith(status: PostCreateStatus.failure, error: e.toString()),
      );
    }
  }

  final AuthRepository authRepository;
  final APIRepository apiRepository;
}
