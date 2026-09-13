import 'package:auto_route/auto_route.dart';
import 'package:democracy/app/bloc/services/websocket_service.dart'
    show WebSocketService, WebsocketStatus;
import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/shared/utils/custom_editing_controller.dart';
import 'package:democracy/app/shared/widgets/bottom_loader.dart';
import 'package:democracy/app/shared/widgets/custom_text.dart';
import 'package:democracy/app/shared/widgets/dialogs.dart';
import 'package:democracy/app/shared/widgets/failure_retry_button.dart';
import 'package:democracy/app/shared/widgets/snack_bar_content.dart';
import 'package:democracy/auth/bloc/auth/auth_bloc.dart';
import 'package:democracy/broadcast/bloc/broadcast/broadcast_bloc.dart';
import 'package:democracy/broadcast/bloc/comment_detail/comment_detail_bloc.dart';
import 'package:democracy/broadcast/bloc/comments/comments_bloc.dart';
import 'package:democracy/broadcast/models/broadcast.dart';
import 'package:democracy/broadcast/models/comment.dart';
import 'package:democracy/user/models/user.dart';
import 'package:democracy/user/view/widgets/profile_image.dart';
import 'package:democracy/user/view/widgets/profile_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

void showComments({
  required BuildContext context,
  required Broadcast broadcast,
}) {
  final broadcastBloc = context.read<BroadcastBloc>();
  showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(15),
        topRight: Radius.circular(15),
      ),
    ),
    builder: (_) => MultiBlocProvider(
      providers: [
        BlocProvider.value(value: broadcastBloc),
        BlocProvider(
          create: (context) =>
              CommentsBloc(webSocketService: context.read<WebSocketService>())
                ..add(CommentsEvent.get(broadcastId: broadcast.id)),
        ),
      ],
      child: Comments(broadcastId: broadcast.id),
    ),
  );
}

class Comments extends StatefulWidget {
  const Comments({super.key, required this.broadcastId});

  final int broadcastId;

  @override
  State<Comments> createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {
  final RefreshController _refreshController = RefreshController();
  final _controller = CustomEditingController();
  final _focusNode = FocusNode();

  bool _disableSendButton = true;

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final me = context.read<AuthBloc>().state.user!;
    final colorScheme = Theme.of(context).colorScheme;
    var timeFormat = DateFormat('hh:mm a');

    return Scaffold(
      appBar: AppBar(title: Text('Comments')),
      body: BlocListener<CommentDetailBloc, CommentDetailState>(
        listener: (context, state) {
          if (state is CommentCreated) {
            if (me.id == state.comment.author.id &&
                _controller.text == state.comment.text) {
              _controller.clear();
              _disableSendButton = false;
              setState(() {});
            }
            context.read<CommentsBloc>().add(
              CommentsEvent.add(comment: state.comment),
            );
          }
          if (state is CommentUpdated) {
            context.read<CommentsBloc>().add(
              CommentsEvent.update(comment: state.comment),
            );
          }
          if (state is CommentDeleted) {
            context.read<CommentsBloc>().add(
              CommentsEvent.remove(commentId: state.commentId),
            );
          }
          if (state is CommentDetailFailure) {
            if (_disableSendButton && _controller.text.isNotEmpty) {
              setState(() => _disableSendButton = false);
            }
            final snackBar = getSnackBar(
              context: context,
              message: state.error,
              status: SnackBarStatus.failure,
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        child: BlocBuilder<BroadcastBloc, BroadcastState>(
          buildWhen: (previous, current) =>
              current.broadcastId == widget.broadcastId,
          builder: (context, broadcastState) {
            bool canManageSpeakers =
                broadcastState.broadcast!.host.id == me.id ||
                broadcastState.broadcast!.coHosts.any((c) => c.id == me.id);
            return BlocBuilder<CommentsBloc, CommentsState>(
              buildWhen: (previous, current) {
                return current.broadcastId == widget.broadcastId;
              },
              builder: (context, state) {
                if (state.status == CommentsStatus.initial ||
                    state.status == CommentsStatus.loading &&
                        state.comments.isEmpty) {
                  return const BottomLoader();
                }

                if (state.status == CommentsStatus.success) {
                  if (_refreshController.headerStatus ==
                      RefreshStatus.refreshing) {
                    _refreshController.refreshCompleted();
                  }
                  if (_refreshController.footerStatus == LoadStatus.loading) {
                    _refreshController.loadComplete();
                  }
                }

                if (state.status == CommentsStatus.failure) {
                  if (_refreshController.headerStatus ==
                      RefreshStatus.refreshing) {
                    _refreshController.refreshFailed();
                  }
                  if (_refreshController.footerStatus == LoadStatus.loading) {
                    _refreshController.loadFailed();
                  }

                  if (state.comments.isEmpty) {
                    return FailureRetryButton(
                      onPressed: () => context.read<CommentsBloc>().add(
                        CommentsEvent.get(broadcastId: widget.broadcastId),
                      ),
                    );
                  }
                }

                return MultiBlocListener(
                  listeners: [
                    BlocListener<WebsocketBloc, WebsocketState>(
                      listener: (context, websocketState) {
                        if (websocketState.status ==
                            WebsocketStatus.connected) {
                          context.read<CommentsBloc>().add(
                            CommentsEvent.get(
                              broadcastId: widget.broadcastId,
                              newestComment: state.comments.first,
                            ),
                          );
                        }
                      },
                    ),
                  ],
                  child: SmartRefresher(
                    enablePullDown: false,
                    enablePullUp: state.hasNext,
                    controller: _refreshController,
                    onLoading: () {
                      context.read<CommentsBloc>().add(
                        CommentsEvent.get(
                          broadcastId: widget.broadcastId,
                          oldestComment: state.comments.last,
                        ),
                      );
                    },
                    footer: ClassicFooter(),
                    child: ListView.builder(
                      reverse: true,
                      itemCount: state.comments.length,
                      itemBuilder: (BuildContext context, int index) {
                        final comment = state.comments[index];
                        return CommentTile(
                          me: me,
                          comment: comment,
                          timeFormat: timeFormat,
                          canManageSpeakers: canManageSpeakers,
                        );
                      },
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: colorScheme.surface,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: SafeArea(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: TextField(
                  focusNode: _focusNode,
                  controller: _controller,
                  autofocus: true,
                  maxLines: 5,
                  minLines: 1,
                  textInputAction: TextInputAction.newline,
                  onChanged: (_) => setState(() {}),
                  decoration: InputDecoration(
                    hintText: 'Comment...',
                    filled: true,
                    fillColor: colorScheme.surfaceContainerHighest,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              IconButton.filled(
                onPressed: _controller.text.trim().isEmpty || _disableSendButton
                    ? null
                    : _createComment,
                icon: const Icon(Icons.check_rounded),
                style: IconButton.styleFrom(
                  backgroundColor: colorScheme.primary,
                  foregroundColor: colorScheme.onPrimary,
                ),
                tooltip: 'Save changes',
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _createComment() {
    context.read<CommentDetailBloc>().add(
      CommentDetailEvent.create(
        broadcastId: widget.broadcastId,
        text: _controller.text,
      ),
    );
    setState(() => _disableSendButton = true);
    Future.delayed(Duration(seconds: 10), () {
      if (_disableSendButton) {
        setState(() => _disableSendButton = false);
      }
    });
  }
}

class CommentTile extends StatelessWidget {
  const CommentTile({
    super.key,
    required this.me,
    required this.comment,
    required this.canManageSpeakers,
    required this.timeFormat,
  });

  final User me;
  final Comment comment;
  final bool canManageSpeakers;
  final DateFormat timeFormat;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ProfileImage(
        userId: comment.author.id,
        username: comment.author.username,
        imageUrl: comment.author.image,
        navigateToProfile: true,
      ),
      title: Row(
        children: [
          me.id == comment.author.id
              ? Text('You')
              : ProfileName(
                  name: comment.author.name,
                  username: comment.author.username,
                ),
          SizedBox(width: 5),
          Icon(Icons.circle, size: 2.5),
          SizedBox(width: 5),
          Text(
            timeFormat.format(comment.createdAt),
            style: TextStyle(color: Theme.of(context).hintColor, fontSize: 12),
          ),
        ],
      ),
      subtitleTextStyle: Theme.of(context).textTheme.bodyMedium,
      subtitle: CustomText(
        text: comment.text,
        style: Theme.of(context).textTheme.bodyMedium!,
      ),
      trailing: canManageSpeakers
          ? PopupMenuButton<String>(
              useRootNavigator: true,
              padding: EdgeInsets.zero,
              menuPadding: EdgeInsets.zero,
              onSelected: (selected) {
                switch (selected) {
                  case 'Delete':
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) {
                        return _DeleteDialog(comment: comment);
                      },
                    );
                }
              },
              itemBuilder: (BuildContext context) => [
                ...['Delete'].map((text) {
                  return PopupMenuItem<String>(
                    value: text,
                    child: Text(text, textAlign: TextAlign.center),
                  );
                }),
              ],
              icon: Icon(Symbols.more_horiz_rounded),
            )
          : SizedBox.shrink(),
    );
  }
}

class _DeleteDialog extends StatelessWidget {
  const _DeleteDialog({required this.comment});

  final Comment comment;

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      title: 'Delete Comment?',
      content: 'This will permanently delete the comment.',
      elevatedButtonText: 'Yes',
      onElevatedButtonPressed: () {
        context.read<CommentDetailBloc>().add(
          CommentDetailEvent.delete(comment: comment),
        );
        context.router.popTop();
      },
      textButtonText: 'No',
      onTextButtonPressed: () {
        context.router.popTop();
      },
    );
  }
}
