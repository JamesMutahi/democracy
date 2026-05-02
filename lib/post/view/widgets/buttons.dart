import 'package:democracy/app/shared/widgets/custom_bottom_sheet.dart';
import 'package:democracy/app/shared/widgets/dialogs.dart';
import 'package:democracy/app/shared/widgets/more_pop_up.dart';
import 'package:democracy/app/shared/pages/report.dart';
import 'package:democracy/app/shared/widgets/snack_bar_content.dart';
import 'package:democracy/auth/bloc/auth/auth_bloc.dart';
import 'package:democracy/post/bloc/post_create/post_create_bloc.dart';
import 'package:democracy/post/bloc/post_detail/post_detail_bloc.dart';
import 'package:democracy/post/models/post.dart';
import 'package:democracy/post/view/shared/post_navigator.dart';
import 'package:democracy/post/view/widgets/post_widget_selector.dart';
import 'package:democracy/user/bloc/user_detail/user_detail_bloc.dart';
import 'package:democracy/user/models/user.dart';
import 'package:democracy/user/view/widgets/profile_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
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
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        final currentUser = state.user!;

        final List<String> menuItems = _buildMenuItems(currentUser, post);

        return MorePopUp(
          onSelected: (selected) =>
              _handleMenuSelection(context, selected, post, currentUser),
          texts: menuItems,
        );
      },
    );
  }

  List<String> _buildMenuItems(User currentUser, Post post) {
    final List<String> items = [];

    if (post.communityNoteOf == null) items.add('Community notes');

    items.add('Share');

    if (currentUser.id == post.author.id) {
      items.add(post.isMuted ? 'Unmute' : 'Mute');
      items.add('Delete');
    } else {
      items.add(post.author.isMuted ? 'Unmute' : 'Mute');
      items.add(post.author.isBlocked ? 'Unblock' : 'Block');
      items.add('Report');
    }

    return items;
  }

  void _handleMenuSelection(
    BuildContext context,
    String selected,
    Post post,
    User? currentUser,
  ) {
    switch (selected) {
      case 'Share':
        showModalBottomSheet<void>(
          context: context,
          shape: const BeveledRectangleBorder(),
          builder: (_) => ShareBottomSheet(post: post),
        );
        break;

      case 'Delete':
        _showDeleteDialog(context, post);
        break;

      case 'Mute':
        if (currentUser?.id == post.author.id) {
          showDialog(
            context: context,
            builder: (_) => MutePostDialog(post: post),
          );
        } else {
          showDialog(
            context: context,
            builder: (_) => MuteDialog(user: post.author),
          );
        }
        break;

      case 'Unmute':
        if (currentUser?.id == post.author.id) {
          context.read<PostDetailBloc>().add(PostDetailEvent.mute(post: post));
        } else {
          context.read<UserDetailBloc>().add(
            UserDetailEvent.mute(user: post.author),
          );
        }
        break;

      case 'Block':
        showDialog(
          context: context,
          builder: (_) => BlockDialog(user: post.author),
        );
        break;

      case 'Unblock':
        context.read<UserDetailBloc>().add(
          UserDetailEvent.block(user: post.author),
        );
        break;

      case 'Report':
        showModalBottomSheet(
          context: context,
          showDragHandle: true,
          isScrollControlled: true,
          useSafeArea: true,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          shape: const BeveledRectangleBorder(),
          builder: (_) => ReportModal(post: post),
        );
        break;

      case 'Community notes':
        navigateToCommunityNotes(context: context, post: post);
        break;
    }
  }

  void _showDeleteDialog(BuildContext context, Post post) {
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
        onButton2Pressed: () => Navigator.pop(context),
      ),
    );
  }
}

class LikeButton extends StatelessWidget {
  const LikeButton({super.key, required this.post});

  final Post post;

  @override
  Widget build(BuildContext context) {
    return _PostTileButton(
      onTap: () =>
          context.read<PostDetailBloc>().add(PostDetailEvent.like(post: post)),
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
  const RepostButton({super.key, required this.post});

  final Post post;

  @override
  Widget build(BuildContext context) {
    final isBlocked = post.author.hasBlocked;

    return _PostTileButton(
      onTap: isBlocked
          ? () => _showBlockedSnackBar(context)
          : () => _showRepostBottomSheet(context, post),
      number: post.reposts,
      icon: Icon(
        Symbols.repeat_rounded,
        color: isBlocked
            ? Theme.of(context).disabledColor
            : (post.isReposted || post.isQuoted)
            ? Colors.green
            : Theme.of(context).colorScheme.outline,
        size: 20,
      ),
    );
  }

  void _showBlockedSnackBar(BuildContext context) {
    final snackBar = getSnackBar(
      context: context,
      message: 'Blocked',
      status: SnackBarStatus.failure,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _showRepostBottomSheet(BuildContext context, Post post) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      shape: const BeveledRectangleBorder(),
      useSafeArea: true,
      builder: (context) => CustomBottomSheet(
        title: 'Repost',
        children: [
          PostWidgetSelector(post: post, isDependency: true),
          CustomBottomSheetContainer(
            text: 'Quote',
            iconData: Icons.format_quote_rounded,
            onTap: () {
              Navigator.pop(context);
              navigateToPostCreate(context: context, repostOf: post);
            },
          ),
          if (post.isReposted)
            CustomBottomSheetContainer(
              text: 'Undo repost',
              iconData: Icons.repeat_rounded,
              onTap: () {
                Navigator.pop(context);
                context.read<PostDetailBloc>().add(
                  PostDetailEvent.deleteRepost(post: post),
                );
              },
            )
          else
            CustomBottomSheetContainer(
              text: 'Repost',
              iconData: Icons.repeat_rounded,
              onTap: () {
                Navigator.pop(context);
                context.read<PostCreateBloc>().add(
                  PostCreateEvent.create(
                    body: '',
                    status: PostStatus.published,
                    repostOf: post.body.isEmpty && post.repostOf != null
                        ? post.repostOf
                        : post,
                    tags: [],
                  ),
                );
              },
            ),
        ],
      ),
    );
  }
}

class ReplyButton extends StatelessWidget {
  const ReplyButton({super.key, required this.post});

  final Post post;

  @override
  Widget build(BuildContext context) {
    final isBlocked = post.author.hasBlocked;

    return _PostTileButton(
      onTap: isBlocked
          ? () => _showBlockedSnackBar(context)
          : () => _navigateToReply(context, post),
      number: post.replies,
      icon: Transform.flip(
        flipX: true,
        child: SvgPicture.asset(
          'assets/icons/chat.svg',
          width: 20,
          height: 20,
          colorFilter: ColorFilter.mode(
            isBlocked
                ? Theme.of(context).disabledColor
                : Theme.of(context).colorScheme.outline,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }

  void _showBlockedSnackBar(BuildContext context) {
    final snackBar = getSnackBar(
      context: context,
      message: 'Blocked',
      status: SnackBarStatus.failure,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _navigateToReply(BuildContext context, Post post) {
    navigateToPostCreate(context: context, replyTo: post);
  }
}

class ViewsButton extends StatelessWidget {
  const ViewsButton({super.key, required this.post});

  final Post post;

  @override
  Widget build(BuildContext context) {
    return _PostTileButton(
      onTap: null,
      number: post.views,
      icon: SvgPicture.asset(
        'assets/icons/bar-graph.svg',
        width: 20,
        height: 20,
        colorFilter: ColorFilter.mode(
          Theme.of(context).colorScheme.outline,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}

class BookmarkButton extends StatelessWidget {
  const BookmarkButton({
    super.key,
    required this.post,
    this.showTrailing = true,
  });

  final Post post;
  final bool showTrailing;

  @override
  Widget build(BuildContext context) {
    return _PostTileButton(
      onTap: () => context.read<PostDetailBloc>().add(
        PostDetailEvent.bookmark(post: post),
      ),
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

class _PostTileButton extends StatelessWidget {
  const _PostTileButton({
    required this.icon,
    required this.number,
    required this.onTap,
  });

  final Widget icon;
  final int number;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    var numberFormat = NumberFormat.compact(locale: "en_UK");
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: onTap,
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          child: Padding(padding: const EdgeInsets.all(7.5), child: icon),
        ),
        if (number > 0)
          Text(
            numberFormat.format(number),
            style: TextStyle(color: Theme.of(context).colorScheme.outline),
          ),
      ],
    );
  }
}
