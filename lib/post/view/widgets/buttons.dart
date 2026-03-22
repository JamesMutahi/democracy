import 'package:democracy/app/utils/custom_bottom_sheet.dart';
import 'package:democracy/app/utils/dialogs.dart';
import 'package:democracy/app/utils/more_pop_up.dart';
import 'package:democracy/app/utils/report.dart';
import 'package:democracy/app/utils/snack_bar_content.dart';
import 'package:democracy/auth/bloc/auth/auth_bloc.dart';
import 'package:democracy/post/bloc/post_detail/post_detail_bloc.dart';
import 'package:democracy/post/models/post.dart';
import 'package:democracy/post/view/community_notes.dart';
import 'package:democracy/post/view/post_create.dart';
import 'package:democracy/post/view/widgets/post_widget_selector.dart';
import 'package:democracy/user/bloc/user_detail/user_detail_bloc.dart';
import 'package:democracy/user/models/user.dart';
import 'package:democracy/user/view/widgets/profile_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';

class PostAuthorProfile extends StatelessWidget {
  const PostAuthorProfile({
    super.key,
    required this.isDependency,
    required this.author,
  });

  final bool isDependency;
  final User author;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 23,
      backgroundColor: isDependency
          ? Colors.transparent
          : Theme.of(context).scaffoldBackgroundColor,
      child: ProfileImage(user: author, navigateToProfile: true),
    );
  }
}

class PostPopUp extends StatelessWidget {
  const PostPopUp({super.key, required this.post});

  final Post post;

  @override
  Widget build(BuildContext context) {
    List<String> buttons = [];
    if (post.communityNoteOf == null) {
      buttons.add('Community notes');
    }
    buttons.add('Share');
    post.author.isMuted ? buttons.add('Unmute') : buttons.add('Mute');
    post.author.isMuted ? buttons.add('Unblock') : buttons.add('Block');
    if (post.author.isMuted) {}
    if (post.author.isBlocked) {}
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
                  builder: (context) => CustomDialog(
                    title: 'Delete',
                    content: 'Are you sure you want to delete this post?',
                    button1Text: 'Yes',
                    onButton1Pressed: () {
                      Navigator.pop(context);
                      context.read<PostDetailBloc>().add(
                        PostDetailEvent.delete(post: post),
                      );
                    },
                    button2Text: 'No',
                    onButton2Pressed: () {
                      Navigator.pop(context);
                    },
                  ),
                );
              case 'Mute':
                showDialog(
                  context: context,
                  builder: (context) => MuteDialog(user: post.author),
                );
              case 'Unmute':
                context.read<UserDetailBloc>().add(
                  UserDetailEvent.mute(user: post.author),
                );
              case 'Block':
                showDialog(
                  context: context,
                  builder: (context) => BlockDialog(user: post.author),
                );
              case 'Unblock':
                context.read<UserDetailBloc>().add(
                  UserDetailEvent.block(user: post.author),
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
              case 'Community notes':
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CommunityNotes(post: post),
                  ),
                );
            }
          },
          texts: user.id == post.author.id
              ? post.communityNoteOf == null
                    ? ['Community notes', 'Share', 'Delete']
                    : ['Share', 'Delete']
              : buttons,
        );
      },
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
        context.read<PostDetailBloc>().add(PostDetailEvent.like(post: post));
      },
      number: post.likes,
      icon: Icon(
        Symbols.favorite_rounded,
        color: post.isLiked
            ? Colors.red
            : Theme.of(context).colorScheme.outline,
        fill: post.isLiked ? 1 : 0,
        size: 20,
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
      onTap: post.author.hasBlocked
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
                useSafeArea: true,
                builder: (BuildContext context) {
                  return CustomBottomSheet(
                    title: 'Repost',
                    children: [
                      PostWidgetSelector(post: post, isDependency: true),
                      CustomBottomSheetContainer(
                        text: 'Quote',
                        iconData: Icons.format_quote_rounded,
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => PostCreate(repostOf: post),
                            ),
                          );
                        },
                      ),
                      post.isReposted
                          ? CustomBottomSheetContainer(
                              text: 'Undo repost',
                              iconData: Icons.loop_rounded,
                              onTap: () {
                                Navigator.pop(context);
                                context.read<PostDetailBloc>().add(
                                  PostDetailEvent.deleteRepost(post: post),
                                );
                              },
                            )
                          : CustomBottomSheetContainer(
                              text: 'Repost',
                              iconData: Icons.repeat_rounded,
                              onTap: () {
                                Navigator.pop(context);
                                context.read<PostDetailBloc>().add(
                                  PostDetailEvent.create(
                                    body: '',
                                    status: PostStatus.published,
                                    repostOf:
                                        post.body.isEmpty &&
                                            post.repostOf != null
                                        ? post.repostOf
                                        : post,
                                    tags: [],
                                  ),
                                );
                              },
                            ),
                    ],
                  );
                },
              );
            },
      number: post.reposts,
      icon: Icon(
        Symbols.repeat_rounded,
        color: post.author.hasBlocked
            ? Theme.of(context).disabledColor
            : post.isReposted || post.isQuoted
            ? Colors.green
            : Theme.of(context).colorScheme.outline,
        size: 20,
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
      onTap: post.author.hasBlocked
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
                  builder: (context) => PostCreate(replyTo: post),
                ),
              );
            },
      number: post.replies,
      icon: Icon(
        Symbols.message_rounded,
        color: post.author.hasBlocked
            ? Theme.of(context).disabledColor
            : Theme.of(context).colorScheme.outline,
        size: 20,
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
      number: post.views,
      icon: Icon(
        Symbols.visibility,
        color: Theme.of(context).colorScheme.outline,
        size: 20,
      ),
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
        context.read<PostDetailBloc>().add(
          PostDetailEvent.bookmark(post: post),
        );
      },
      number: showTrailing ? post.bookmarks : 0,
      icon: Icon(
        Symbols.bookmark_rounded,
        color: post.isBookmarked
            ? Colors.blue
            : Theme.of(context).colorScheme.outline,
        fill: post.isBookmarked ? 1 : 0,
        size: 20,
      ),
    );
  }
}

class PostTileButton extends StatelessWidget {
  const PostTileButton({
    super.key,
    required this.icon,
    required this.number,
    required this.onTap,
  });

  final Icon icon;
  final int number;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: onTap,
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          child: Padding(padding: const EdgeInsets.all(7.5), child: icon),
        ),
        number > 0
            ? Text(
                number.toString(),
                style: TextStyle(color: Theme.of(context).colorScheme.outline),
              )
            : SizedBox.shrink(),
      ],
    );
  }
}
