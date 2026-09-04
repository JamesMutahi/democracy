import 'package:auto_route/auto_route.dart';
import 'package:democracy/app/bloc/services/websocket_service.dart';
import 'package:democracy/app/shared/widgets/dialogs.dart';
import 'package:democracy/app/shared/widgets/loader_overlay_widgets.dart';
import 'package:democracy/ballot/models/ballot.dart';
import 'package:democracy/broadcast/models/broadcast.dart';
import 'package:democracy/constitution/models/section.dart';
import 'package:democracy/petition/models/petition.dart';
import 'package:democracy/post/bloc/draft_detail/draft_detail_bloc.dart';
import 'package:democracy/post/bloc/post_create/post_create_bloc.dart';
import 'package:democracy/post/bloc/reply_to/reply_to_bloc.dart';
import 'package:democracy/post/models/post.dart';
import 'package:democracy/post/view/widgets/post_form_widget.dart';
import 'package:democracy/survey/models/survey.dart';
import 'package:democracy/user/bloc/users/users_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:material_symbols_icons/symbols.dart';

@RoutePage()
class PostCreatePage extends StatefulWidget {
  const PostCreatePage({
    super.key,
    this.replyTo,
    this.repostOf,
    this.ballot,
    this.survey,
    this.petition,
    this.broadcast,
    this.section,
  });

  final Post? replyTo;
  final Post? repostOf;
  final Ballot? ballot;
  final Survey? survey;
  final Petition? petition;
  final Broadcast? broadcast;
  final Section? section;

  @override
  State<PostCreatePage> createState() => _PostCreatePageState();
}

class _PostCreatePageState extends State<PostCreatePage> {
  // ✅ Now valid because PostFormWidgetState is public
  final GlobalKey<PostFormWidgetState> _formKey =
      GlobalKey<PostFormWidgetState>();
  bool _canPost = false;

  void _createPost() {
    final data = _formKey.currentState!.formData;
    context.loaderOverlay.show();
    context.read<PostCreateBloc>().add(
      PostCreateEvent.create(
        body: data.body,
        status: PostStatus.published,
        replyTo: widget.replyTo,
        repostOf: widget.repostOf,
        ballot: widget.ballot,
        survey: widget.survey,
        petition: widget.petition,
        broadcast: widget.broadcast,
        section: data.section,
        filePaths: [
          ...data.media.map((m) => m.path),
          if (data.document != null) data.document!.path,
        ],
        location: data.location,
      ),
    );
    Future.delayed(const Duration(seconds: 10), () {
      if (mounted) context.loaderOverlay.hide();
    });
  }

  void _saveDraft() {
    final data = _formKey.currentState!.formData;
    context.loaderOverlay.show();
    context.read<DraftDetailBloc>().add(
      DraftDetailEvent.create(
        id: null,
        body: data.body,
        replyTo: widget.replyTo,
        repostOf: widget.repostOf,
        ballot: widget.ballot,
        survey: widget.survey,
        petition: widget.petition,
        broadcast: widget.broadcast,
        section: data.section,
        filePaths: [
          ...data.media.map((m) => m.path),
          if (data.document != null) data.document!.path,
        ],
        location: data.location,
      ),
    );
    Future.delayed(const Duration(seconds: 10), () {
      if (mounted) context.loaderOverlay.hide();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            final bloc = ReplyToBloc(
              webSocketService: context.read<WebSocketService>(),
            );
            if (widget.replyTo != null) {
              bloc.add(ReplyToEvent.get(postId: widget.replyTo!.id));
            }
            return bloc;
          },
        ),
        BlocProvider(
          create: (context) =>
              UsersBloc(webSocketService: context.read<WebSocketService>()),
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<PostCreateBloc, PostCreateState>(
            listener: (context, state) {
              if (state.status == PostCreateStatus.success) {
                final post = state.post!;
                if (widget.repostOf != null || widget.replyTo == null) {
                  context.router.popTop();
                  return;
                }
                final replyTos = context.read<ReplyToBloc>().state.posts;
                if (!replyTos.any((p) => p.id == post.repostOf?.id)) {
                  context.router.popTop();
                }
              }
            },
          ),
          BlocListener<DraftDetailBloc, DraftDetailState>(
            listener: (context, state) {
              if (state is DraftSaved) context.router.popTop();
            },
          ),
        ],
        child: PopScope(
          canPop: false,
          onPopInvokedWithResult: (didPop, _) {
            if (didPop) return;
            if (!_canPost) {
              context.router.popTop();
            } else {
              showDialog(
                context: context,
                builder: (context) =>
                    _SaveDraftDialog(onYesPressed: _saveDraft),
              );
            }
          },
          child: LoaderOverlay(
            overlayWidgetBuilder: (_) {
              return BlocBuilder<PostCreateBloc, PostCreateState>(
                builder: (context, state) {
                  return state.status == PostCreateStatus.failure
                      ? LoaderOverlayFailure(
                          onRetry: () => context.read<PostCreateBloc>().add(
                            PostCreateEvent.retry(),
                          ),
                        )
                      : LoaderOverlayLoading(progress: state.progress);
                },
              );
            },
            child: Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  icon: const Icon(Symbols.close),
                  onPressed: () {
                    if (!_canPost) {
                      context.router.popTop();
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) =>
                            _SaveDraftDialog(onYesPressed: _saveDraft),
                      );
                    }
                  },
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: ValueListenableBuilder<bool>(
                      valueListenable: ValueNotifier<bool>(
                        _canPost,
                      ), // Simplified for this example, or use a dedicated notifier
                      builder: (context, canPost, child) {
                        return FilledButton(
                          onPressed: canPost
                              ? () => showDialog(
                                  context: context,
                                  builder: (context) => _PostCreateDialog(
                                    onYesPressed: _createPost,
                                  ),
                                )
                              : null,
                          style: FilledButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 12,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: Text(
                            widget.replyTo != null ? 'Reply' : 'Post',
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              body: PostFormWidget(
                key: _formKey,
                replyTo: widget.replyTo,
                repostOf: widget.repostOf,
                ballot: widget.ballot,
                survey: widget.survey,
                petition: widget.petition,
                broadcast: widget.broadcast,
                section: widget.section,
                onCanPostChanged: (canPost) {
                  setState(() => _canPost = canPost);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _PostCreateDialog extends StatelessWidget {
  const _PostCreateDialog({required this.onYesPressed});

  final VoidCallback onYesPressed;

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      title: 'Post',
      content: 'Are you sure you want to post this?',
      textButtonText: 'Yes',
      onTextButtonPressed: () {
        context.router.popTop();
        onYesPressed();
      },
      elevatedButtonText: 'No',
      onElevatedButtonPressed: () => context.router.popTop(),
    );
  }
}

class _SaveDraftDialog extends StatelessWidget {
  const _SaveDraftDialog({required this.onYesPressed});

  final VoidCallback onYesPressed;

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      title: 'Save as draft',
      content:
          'Do you want to save this post as a draft?\nYou can post it later.',
      textButtonText: 'Delete',
      onTextButtonPressed: () {
        context.router.popTop();
        context.router.popTop();
      },
      elevatedButtonText: 'Save',
      onElevatedButtonPressed: () {
        context.router.popTop();
        onYesPressed();
      },
    );
  }
}
