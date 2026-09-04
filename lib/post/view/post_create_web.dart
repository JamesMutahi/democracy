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

class PostCreateWebDialog extends StatefulWidget {
  const PostCreateWebDialog({
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
  State<PostCreateWebDialog> createState() => _PostCreateWebDialogState();
}

class _PostCreateWebDialogState extends State<PostCreateWebDialog> {
  final GlobalKey<PostFormWidgetState> _formKey =
      GlobalKey<PostFormWidgetState>();
  bool _canPost = false;

  void _createPost() {
    final data = _formKey.currentState!.formData;
    context.loaderOverlay.show();

    try {
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
    } catch (e) {
      // Safety net: If the bloc is missing from the tree, hide the loader immediately to prevent hanging
      context.loaderOverlay.hide();
      return;
    }

    Future.delayed(const Duration(seconds: 10), () {
      if (mounted) context.loaderOverlay.hide();
    });
  }

  void _saveDraft() {
    final data = _formKey.currentState!.formData;
    context.loaderOverlay.show();

    try {
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
    } catch (e) {
      context.loaderOverlay.hide();
      return;
    }

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
            if (widget.replyTo != null)
              bloc.add(ReplyToEvent.get(postId: widget.replyTo!.id));
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
                context.loaderOverlay
                    .hide(); // Explicitly hide loader on success
                final post = state.post!;
                if (widget.repostOf != null || widget.replyTo == null) {
                  Navigator.of(
                    context,
                    rootNavigator: true,
                  ).pop(); // Safely closes the standard Flutter dialog
                  return;
                }
                final replyTos = context.read<ReplyToBloc>().state.posts;
                if (!replyTos.any((p) => p.id == post.repostOf?.id)) {
                  Navigator.of(context, rootNavigator: true).pop();
                }
              } else if (state.status == PostCreateStatus.failure) {
                context.loaderOverlay.hide(); // Ensure loader hides on failure
              }
            },
          ),
          BlocListener<DraftDetailBloc, DraftDetailState>(
            listener: (context, state) {
              if (state is DraftSaved) {
                context.loaderOverlay.hide(); // Explicitly hide loader
                Navigator.of(
                  context,
                  rootNavigator: true,
                ).pop(); // Safely closes dialog
              }
            },
          ),
        ],
        child: PopScope(
          canPop: false,
          onPopInvokedWithResult: (didPop, _) {
            if (didPop) return;
            if (!_canPost) {
              Navigator.of(context, rootNavigator: true).pop();
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
            child: Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              insetPadding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 40,
              ),
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 600,
                  maxHeight: 800,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 16,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.replyTo != null ? 'Reply' : 'Create Post',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Row(
                            children: [
                              FilledButton(
                                onPressed: _canPost
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
                              ),
                              const SizedBox(width: 8),
                              IconButton(
                                icon: const Icon(Symbols.close),
                                onPressed: () {
                                  if (!_canPost) {
                                    Navigator.of(
                                      context,
                                      rootNavigator: true,
                                    ).pop();
                                  } else {
                                    showDialog(
                                      context: context,
                                      builder: (context) => _SaveDraftDialog(
                                        onYesPressed: _saveDraft,
                                      ),
                                    );
                                  }
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Divider(height: 1),
                    Flexible(
                      child: PostFormWidget(
                        key: _formKey,
                        replyTo: widget.replyTo,
                        repostOf: widget.repostOf,
                        ballot: widget.ballot,
                        survey: widget.survey,
                        petition: widget.petition,
                        broadcast: widget.broadcast,
                        section: widget.section,
                        onCanPostChanged: (canPost) =>
                            setState(() => _canPost = canPost),
                      ),
                    ),
                  ],
                ),
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
        Navigator.of(
          context,
          rootNavigator: true,
        ).pop(); // Safely closes the dialog
        onYesPressed();
      },
      elevatedButtonText: 'No',
      onElevatedButtonPressed: () =>
          Navigator.of(context, rootNavigator: true).pop(),
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
        // Closes the Save Draft confirmation dialog
        Navigator.of(context, rootNavigator: true).pop();
        // Closes the underlying Web Dialog (or Mobile Page if wrapped in a dialog)
        Navigator.of(context, rootNavigator: true).pop();
      },
      elevatedButtonText: 'Save',
      onElevatedButtonPressed: () {
        Navigator.of(
          context,
          rootNavigator: true,
        ).pop(); // Closes the Save Draft dialog
        onYesPressed();
      },
    );
  }
}
