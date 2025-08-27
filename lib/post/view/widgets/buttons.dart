import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/utils/custom_bottom_sheet.dart';
import 'package:democracy/app/utils/dialogs.dart';
import 'package:democracy/app/utils/more_pop_up.dart';
import 'package:democracy/app/utils/report.dart';
import 'package:democracy/app/utils/snack_bar_content.dart';
import 'package:democracy/auth/bloc/auth/auth_bloc.dart';
import 'package:democracy/post/models/post.dart';
import 'package:democracy/post/view/post_create.dart';
import 'package:democracy/post/view/widgets/post_tile.dart';
import 'package:democracy/user/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';

class PostMorePopUp extends StatelessWidget {
  const PostMorePopUp({super.key, required this.post});

  final Post post;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        late User user;
        if (state is Authenticated) {
          user = state.user;
        }
        return MorePopUp(
          onSelected: (selected) {
            switch (selected) {
              case 'Share':
                showModalBottomSheet<void>(
                  context: context,
                  shape: const BeveledRectangleBorder(),
                  builder: (BuildContext context) {
                    return ShareBottomSheet(post: post);
                  },
                );
              case 'Delete':
                showDialog(
                  context: context,
                  builder:
                      (context) => CustomDialog(
                        title: 'Delete',
                        content: 'Are you sure you want to delete this post?',
                        onYesPressed: () {
                          context.read<WebsocketBloc>().add(
                            WebsocketEvent.deletePost(post: post),
                          );
                        },
                      ),
                );
              case 'Mute':
                showDialog(
                  context: context,
                  builder: (context) => MuteDialog(user: post.author),
                );
              case 'Unmute':
                context.read<WebsocketBloc>().add(
                  WebsocketEvent.muteUser(id: post.author.id),
                );
              case 'Block':
                showDialog(
                  context: context,
                  builder: (context) => BlockDialog(user: post.author),
                );
              case 'Unblock':
                context.read<WebsocketBloc>().add(
                  WebsocketEvent.blockUser(id: post.author.id),
                );
              case 'Report':
                showModalBottomSheet(
                  context: context,
                  showDragHandle: true,
                  isScrollControlled: true,
                  useSafeArea: true,
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  shape: const BeveledRectangleBorder(),
                  builder: (context) => ReportModal(post: post),
                );
            }
          },
          texts:
              user.id == post.author.id
                  ? ['Share', 'Delete']
                  : [
                    'Share',
                    post.author.isMuted ? 'Unmute' : 'Mute',
                    post.author.isBlocked ? 'Unblock' : 'Block',
                    'Report',
                  ],
        );
      },
    );
  }
}

class PostTileButton extends StatelessWidget {
  const PostTileButton({
    super.key,
    required this.child,
    this.trailing,
    required this.onTap,
  });

  final Widget child;
  final Text? trailing;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: onTap,
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(padding: const EdgeInsets.all(7.5), child: child),
        ),
        (trailing == null) ? SizedBox.shrink() : trailing!,
      ],
    );
  }
}

class RepostDeleteButton extends StatelessWidget {
  const RepostDeleteButton({super.key, required this.post});

  final Post post;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showDialog(
          context: context,
          builder:
              (context) => CustomDialog(
                title: 'Delete',
                content: 'Are you sure you want to delete this repost?',
                onYesPressed: () {
                  context.read<WebsocketBloc>().add(
                    WebsocketEvent.deletePost(post: post),
                  );
                },
              ),
        );
      },
      icon: PostButtonIcon(iconData: Symbols.delete_outline_rounded),
    );
  }
}

class LikeButton extends StatelessWidget {
  const LikeButton({super.key, required this.post, required this.numberFormat});

  final Post post;
  final NumberFormat numberFormat;

  @override
  Widget build(BuildContext context) {
    return PostTileButton(
      onTap: () {
        context.read<WebsocketBloc>().add(WebsocketEvent.likePost(post: post));
      },
      trailing:
          (post.likes > 0)
              ? Text(
                numberFormat.format(post.likes),
                style: TextStyle(color: Theme.of(context).colorScheme.outline),
              )
              : null,
      child: PostButtonIcon(
        iconData: Symbols.favorite_rounded,
        color:
            post.isLiked ? Colors.red : Theme.of(context).colorScheme.outline,
        fill: post.isLiked ? 1 : 0,
      ),
    );
  }
}

class RepostButton extends StatelessWidget {
  const RepostButton({
    super.key,
    required this.post,
    required this.numberFormat,
  });

  final Post post;
  final NumberFormat numberFormat;

  @override
  Widget build(BuildContext context) {
    return PostTileButton(
      onTap:
          post.author.hasBlocked
              ? () {
                final snackBar = getSnackBar(
                  context: context,
                  message: 'Blocked',
                  status: SnackBarStatus.failure,
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
              : () {
                showModalBottomSheet<void>(
                  context: context,
                  isScrollControlled: true,
                  shape: const BeveledRectangleBorder(),
                  builder: (BuildContext context) {
                    return CustomBottomSheet(
                      title: 'Repost',
                      children: [
                        PostTile(post: post, isDependency: true),
                        CustomBottomSheetContainer(
                          text: 'Quote',
                          iconData: Icons.format_quote_rounded,
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => PostCreate(post: post),
                              ),
                            );
                          },
                        ),
                        CustomBottomSheetContainer(
                          text: 'Repost',
                          iconData: Icons.loop_rounded,
                          onTap: () {
                            Navigator.pop(context);
                            context.read<WebsocketBloc>().add(
                              WebsocketEvent.createPost(
                                body: '',
                                status: PostStatus.published,
                                repostOf:
                                    post.body.isEmpty && post.repostOf != null
                                        ? post.repostOf
                                        : post,
                                replyTo: null,
                                ballot: null,
                                survey: null,
                                petition: null,
                                taggedUserIds: [],
                              ),
                            );
                          },
                        ),
                      ],
                    );
                  },
                );
              },
      trailing:
          (post.reposts > 0)
              ? Text(
                numberFormat.format(post.reposts),
                style: TextStyle(
                  color:
                      post.author.hasBlocked
                          ? Theme.of(context).disabledColor
                          : Theme.of(context).colorScheme.outline,
                ),
              )
              : null,
      child: PostButtonIcon(
        iconData: Symbols.loop_rounded,
        color:
            post.author.hasBlocked
                ? Theme.of(context).disabledColor
                : Theme.of(context).colorScheme.outline,
      ),
    );
  }
}

class ReplyButton extends StatelessWidget {
  const ReplyButton({
    super.key,
    required this.post,
    required this.numberFormat,
  });

  final Post post;
  final NumberFormat numberFormat;

  @override
  Widget build(BuildContext context) {
    return PostTileButton(
      onTap:
          post.author.hasBlocked
              ? () {
                final snackBar = getSnackBar(
                  context: context,
                  message: 'Blocked',
                  status: SnackBarStatus.failure,
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
              : () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PostCreate(post: post, isReply: true),
                  ),
                );
              },
      trailing:
          (post.replies > 0)
              ? Text(
                numberFormat.format(post.replies),
                style: TextStyle(
                  color:
                      post.author.hasBlocked
                          ? Theme.of(context).disabledColor
                          : Theme.of(context).colorScheme.outline,
                ),
              )
              : null,
      child: PostButtonIcon(
        iconData: Symbols.message_rounded,
        color:
            post.author.hasBlocked
                ? Theme.of(context).disabledColor
                : Theme.of(context).colorScheme.outline,
      ),
    );
  }
}

class ViewsButton extends StatelessWidget {
  const ViewsButton({
    super.key,
    required this.post,
    required this.numberFormat,
  });

  final Post post;
  final NumberFormat numberFormat;

  @override
  Widget build(BuildContext context) {
    return PostTileButton(
      onTap: () {},
      trailing:
          (post.views > 0)
              ? Text(
                numberFormat.format(post.views),
                style: TextStyle(color: Theme.of(context).colorScheme.outline),
              )
              : null,
      child: PostButtonIcon(iconData: Symbols.visibility),
    );
  }
}

class BookmarkButton extends StatelessWidget {
  const BookmarkButton({
    super.key,
    required this.post,
    this.showTrailing = true,
    required this.numberFormat,
  });

  final Post post;
  final bool showTrailing;
  final NumberFormat numberFormat;

  @override
  Widget build(BuildContext context) {
    return PostTileButton(
      onTap: () {
        context.read<WebsocketBloc>().add(
          WebsocketEvent.bookmarkPost(post: post),
        );
      },
      trailing:
          (post.bookmarks > 0 && showTrailing)
              ? Text(
                numberFormat.format(post.bookmarks),
                style: TextStyle(color: Theme.of(context).colorScheme.outline),
              )
              : null,
      child: PostButtonIcon(
        iconData: Symbols.bookmark_rounded,
        color:
            post.isBookmarked
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.outline,
        fill: post.isBookmarked ? 1 : 0,
      ),
    );
  }
}

class PostButtonIcon extends StatelessWidget {
  const PostButtonIcon({
    super.key,
    required this.iconData,
    this.color,
    this.fill = 0,
  });

  final IconData iconData;
  final Color? color;
  final double fill;

  @override
  Widget build(BuildContext context) {
    return Icon(
      iconData,
      size: 20,
      color: color ?? Theme.of(context).colorScheme.outline,
      fill: fill,
    );
  }
}
