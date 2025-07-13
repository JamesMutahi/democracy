import 'dart:async';

import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/utils/view/custom_text.dart';
import 'package:democracy/app/utils/view/more_pop_up.dart';
import 'package:democracy/app/utils/view/profile_image.dart';
import 'package:democracy/app/utils/view/report.dart';
import 'package:democracy/app/utils/view/share_bottom_sheet.dart';
import 'package:democracy/app/view/widgets/profile_page.dart';
import 'package:democracy/poll/view/poll_tile.dart';
import 'package:democracy/post/models/post.dart';
import 'package:democracy/post/view/post_create.dart';
import 'package:democracy/post/view/post_detail.dart';
import 'package:democracy/survey/view/survey_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';

class PostTile extends StatelessWidget {
  const PostTile({super.key, required this.post, this.isChildOfPost = false});

  final Post post;
  final bool isChildOfPost;

  @override
  Widget build(BuildContext context) {
    var numberFormat = NumberFormat.compact(locale: "en_UK");
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (context) => PostDetail(post: post, key: ValueKey(post.id)),
          ),
        ).whenComplete(() {
          if (context.mounted) {
            context.read<WebsocketBloc>().add(
              WebsocketEvent.unsubscribeReplies(post: post),
            );
          }
        });
      },
      child: Container(
        padding: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 5),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color:
                  (isChildOfPost)
                      ? Colors.transparent
                      : Theme.of(context).disabledColor.withAlpha(30),
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileImage(user: post.author),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        post.author.displayName,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      isChildOfPost
                          ? SizedBox.shrink()
                          : Row(
                            children: [
                              TimeDifferenceInfo(publishedAt: post.publishedAt),
                              isChildOfPost
                                  ? SizedBox.shrink()
                                  : PostMorePopUp(post: post),
                            ],
                          ),
                    ],
                  ),
                  CustomText(
                    text: post.body,
                    onUserTagPressed: (userId) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder:
                              (context) => ProfilePage(
                                user: post.taggedUsers.firstWhere(
                                  (user) => user.id == int.parse(userId),
                                ),
                              ),
                        ),
                      );
                    },
                  ),
                  (post.repostOf == null)
                      ? SizedBox.shrink()
                      : isChildOfPost
                      ? SizedBox.shrink()
                      : DependencyContainer(
                        child: PostTile(
                          post: post.repostOf!,
                          isChildOfPost: true,
                        ),
                      ),
                  (post.poll == null)
                      ? SizedBox.shrink()
                      : DependencyContainer(
                        child: PollTile(poll: post.poll!, isChildOfPost: true),
                      ),
                  (post.survey == null)
                      ? SizedBox.shrink()
                      : DependencyContainer(
                        child: SurveyTile(
                          survey: post.survey!,
                          isChildOfPost: true,
                        ),
                      ),
                  SizedBox(height: 5),
                  isChildOfPost
                      ? SizedBox.shrink()
                      : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ReplyButton(post: post, numberFormat: numberFormat),
                          RepostButton(post: post, numberFormat: numberFormat),
                          LikeButton(post: post, numberFormat: numberFormat),
                          ViewsButton(post: post, numberFormat: numberFormat),
                          Row(
                            children: [
                              BookmarkButton(
                                post: post,
                                showTrailing: false,
                                numberFormat: numberFormat,
                              ),
                              ShareButton(post: post),
                            ],
                          ),
                        ],
                      ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DependencyContainer extends StatelessWidget {
  const DependencyContainer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).disabledColor.withAlpha(30),
        ),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: child,
    );
  }
}

class PostMorePopUp extends StatelessWidget {
  const PostMorePopUp({super.key, required this.post});

  final Post post;

  @override
  Widget build(BuildContext context) {
    return MorePopUp(
      onSelected: (selected) {
        switch (selected) {
          case 'Mute':
            //   TODO:
            return;
          case 'Block':
            //   TODO:
            return;
          case 'Report':
            showGeneralDialog(
              context: context,
              transitionDuration: const Duration(milliseconds: 300),
              pageBuilder: (context, animation, secondaryAnimation) {
                return ReportModal(post: post);
              },
            );
        }
      },
      texts: ['Mute', 'Block', 'Report'],
    );
  }
}

class PostTileButton extends StatelessWidget {
  const PostTileButton({
    super.key,
    required this.icon,
    this.trailing,
    required this.onTap,
  });

  final Icon icon;
  final String? trailing;
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
          child: Padding(padding: const EdgeInsets.all(7.5), child: icon),
        ),
        (trailing == null)
            ? SizedBox.shrink()
            : Text(
              trailing!,
              style: TextStyle(color: Theme.of(context).colorScheme.outline),
            ),
      ],
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
      icon: Icon(
        Symbols.favorite_rounded,
        size: 20,
        color:
            post.isLiked
                ? Theme.of(context).colorScheme.error
                : Theme.of(context).colorScheme.outline,
        fill: post.isLiked ? 1 : 0,
      ),
      trailing: (post.likes > 0) ? numberFormat.format(post.likes) : null,
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
      onTap: () {
        Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (context) => PostCreate(post: post)));
      },
      icon: Icon(
        Symbols.loop_rounded,
        size: 20,
        color: Theme.of(context).colorScheme.outline,
      ),
      trailing: (post.reposts > 0) ? numberFormat.format(post.reposts) : null,
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
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PostCreate(post: post, isReply: true),
          ),
        );
      },
      icon: Icon(
        Symbols.message_rounded,
        size: 20,
        color: Theme.of(context).colorScheme.outline,
      ),
      trailing: (post.replies > 0) ? numberFormat.format(post.replies) : null,
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
      icon: Icon(
        Symbols.poll_rounded,
        size: 20,
        color: Theme.of(context).colorScheme.outline,
      ),
      trailing: (post.views > 0) ? numberFormat.format(post.views) : null,
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
      icon: Icon(
        Symbols.bookmark_rounded,
        size: 20,
        color:
            post.isBookmarked
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.outline,
        fill: post.isBookmarked ? 1 : 0,
      ),
      trailing:
          showTrailing
              ? (post.bookmarks > 0)
                  ? numberFormat.format(post.bookmarks)
                  : null
              : null,
    );
  }
}

class ShareButton extends StatelessWidget {
  const ShareButton({super.key, required this.post});

  final Post post;

  @override
  Widget build(BuildContext context) {
    return PostTileButton(
      onTap: () {
        showModalBottomSheet<void>(
          context: context,
          shape: const BeveledRectangleBorder(),
          builder: (BuildContext context) {
            return ShareBottomSheet(post: post);
          },
        );
      },
      icon: Icon(
        Symbols.share_rounded,
        size: 20,
        color: Theme.of(context).colorScheme.outline,
      ),
    );
  }
}

class TimeDifferenceInfo extends StatefulWidget {
  const TimeDifferenceInfo({super.key, required this.publishedAt});

  final DateTime publishedAt;

  @override
  State<TimeDifferenceInfo> createState() => _TimeDifferenceInfoState();
}

class _TimeDifferenceInfoState extends State<TimeDifferenceInfo> {
  Timer? timer;
  String timeSince = '';

  @override
  void initState() {
    super.initState();
    getTimeSince();
    timer = Timer.periodic(Duration(minutes: 1), (Timer t) => getTimeSince());
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void getTimeSince() {
    Duration diff = DateTime.now().difference(widget.publishedAt);
    setState(() {
      var diffSeconds = diff.inSeconds;
      var unit = 's';
      var difference = diffSeconds;
      if (diffSeconds > 1 || diffSeconds < 1) {
        unit = 's';
      }
      if (diffSeconds > 59) {
        final diffMinutes = diff.inMinutes;
        difference = diffMinutes;
        unit = 'min';
        if (diffMinutes > 1) {
          unit = 'min';
        }
        if (diffMinutes > 59) {
          final diffHours = diff.inHours;
          difference = diffHours;
          unit = 'h';
          if (diffHours > 1) {
            unit = 'h';
          }
          if (diffHours > 24) {
            final diffDays = diff.inDays;
            difference = diffDays;
            unit = 'd';
            if (diffDays > 1) {
              unit = 'd';
            }
            if (diffDays > 30) {
              final diffMonths = (diffDays / 30).floor();
              difference = diffMonths;
              unit = 'm';
              if (diffMonths > 1) {
                unit = 'm';
              }
              if (diffDays > 365) {
                final diffYears = (diffDays / 365).floor();
                difference = diffYears;
                unit = 'y';
                if (diffYears > 1) {
                  unit = 'yrs';
                }
              }
            }
          }
        }
      }
      timeSince = '$difference$unit';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      timeSince,
      style: TextStyle(color: Theme.of(context).colorScheme.outline),
    );
  }
}
