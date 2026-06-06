import 'package:auto_route/auto_route.dart';
import 'package:democracy/app/bloc/services/websocket_service.dart';
import 'package:democracy/app/shared/widgets/dialogs.dart';
import 'package:democracy/app/shared/widgets/loader_overlay_widgets.dart';
import 'package:democracy/post/bloc/post_create/post_create_bloc.dart';
import 'package:democracy/post/bloc/reply_to/reply_to_bloc.dart';
import 'package:democracy/post/models/post.dart';
import 'package:democracy/post/view/widgets/post_form_widgets.dart';
import 'package:democracy/post/view/widgets/reply_tos.dart';
import 'package:democracy/post/view/widgets/thread_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:material_symbols_icons/symbols.dart';

@RoutePage()
class CommunityNoteCreate extends StatefulWidget {
  const CommunityNoteCreate({super.key, @PathParam('id') required this.postId});

  final int postId;

  @override
  State<CommunityNoteCreate> createState() => _CommunityNoteCreateState();
}

class _CommunityNoteCreateState extends State<CommunityNoteCreate> {
  final _controller = TextEditingController();
  final ValueKey _centerKey = const ValueKey('center');

  bool _disablePostButton = true;

  void _createPost() {
    context.loaderOverlay.show();

    context.read<PostCreateBloc>().add(
      PostCreateEvent.create(
        body: _controller.text,
        status: PostStatus.published,
        communityNoteOfId: widget.postId,
      ),
    );
    Future.delayed(Duration(seconds: 10), () {
      if (mounted) {
        context.loaderOverlay.hide();
      }
    });
  }

  void _closePage() {
    _disablePostButton
        ? Navigator.pop(context)
        : showDialog(context: context, builder: (context) => _CloseDialog());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final bloc = ReplyToBloc(
          webSocketService: context.read<WebSocketService>(),
        );
        bloc.add(ReplyToEvent.get(postId: widget.postId));
        return bloc;
      },
      child: MultiBlocListener(
        listeners: [
          BlocListener<PostCreateBloc, PostCreateState>(
            listener: (context, state) {
              if (state.status == PostCreateStatus.success) {
                if (state.post?.communityNoteOf?.id == widget.postId) {
                  context.router.popTop();
                }
              }
            },
          ),
        ],
        child: PopScope(
          canPop: false,
          onPopInvokedWithResult: (didPop, result) {
            if (didPop) {
              return;
            }
            _closePage();
          },
          child: LoaderOverlay(
            overlayWidgetBuilder: (_) {
              return BlocBuilder<PostCreateBloc, PostCreateState>(
                builder: (context, state) {
                  return state.status == PostCreateStatus.failure
                      ? LoaderOverlayFailure(
                          onRetry: () {
                            context.read<PostCreateBloc>().add(
                              PostCreateEvent.retry(),
                            );
                          },
                        )
                      : LoaderOverlayLoading(progress: state.progress);
                },
              );
            },
            child: Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  onPressed: _closePage,
                  icon: Icon(Symbols.close),
                ),
                actions: [
                  OutlinedButton(
                    onPressed: _disablePostButton
                        ? null
                        : () {
                            showDialog(
                              context: context,
                              builder: (context) =>
                                  _CreateDialog(onYesPressed: _createPost),
                            );
                          },
                    child: Text('Post'),
                  ),
                ],
                actionsPadding: EdgeInsets.only(right: 15),
              ),
              body: CustomScrollView(
                center: _centerKey,
                slivers: <Widget>[
                  ReplyTos(postId: widget.postId),
                  SliverToBoxAdapter(
                    key: _centerKey,
                    child: Stack(
                      children: [
                        ThreadLine(
                          showBottomThread: false,
                          showTopThread: true,
                        ),
                        Container(
                          padding: EdgeInsets.only(
                            left: 10,
                            right: 15,
                            top: 10,
                            bottom: 5,
                          ),
                          child: SingleChildScrollView(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const PostAuthor(),
                                PostTextField(
                                  controller: _controller,
                                  hintText: "What's the note?",
                                  onChanged: (value) {
                                    setState(() {
                                      if (value == '') {
                                        _disablePostButton = true;
                                      } else {
                                        _disablePostButton = false;
                                      }
                                    });
                                  },
                                  onContentInsertion: (imageFile) {},
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _CreateDialog extends StatelessWidget {
  const _CreateDialog({required this.onYesPressed});

  final VoidCallback onYesPressed;

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      title: 'Post',
      content: 'Are you sure you want to post this?',
      button1Text: 'Yes',
      onButton1Pressed: () {
        context.router.popTop();
        onYesPressed();
      },
      button2Text: 'No',
      onButton2Pressed: () {
        context.router.popTop();
      },
    );
  }
}

class _CloseDialog extends StatelessWidget {
  const _CloseDialog();

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      title: 'Close',
      content:
          'Are you sure you want to close this? \n'
          'Progress is not saved',
      button1Text: 'Yes',
      onButton1Pressed: () {
        context.router.popTop();
        context.router.popTop();
      },
      button2Text: 'No',
      onButton2Pressed: () {
        context.router.popTop();
      },
    );
  }
}
