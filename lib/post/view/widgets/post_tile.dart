import 'dart:async';

import 'package:democracy/app/utils/view/custom_text.dart';
import 'package:democracy/app/utils/view/profile_image.dart';
import 'package:democracy/auth/bloc/auth/auth_bloc.dart';
import 'package:democracy/post/view/widgets/buttons.dart';
import 'package:democracy/user/models/user.dart';
import 'package:democracy/user/view/profile.dart';
import 'package:democracy/poll/view/poll_tile.dart';
import 'package:democracy/post/models/post.dart';
import 'package:democracy/post/view/post_detail.dart';
import 'package:democracy/survey/view/survey_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';

class PostTile extends StatelessWidget {
  const PostTile({
    super.key,
    required this.post,
    this.isDependency = false,
    this.showTopThread = false,
    this.showBottomThread = false,
    this.checkVisibility = false,
  });

  final Post post;
  final bool isDependency;
  final bool showTopThread;
  final bool showBottomThread;
  final bool checkVisibility;

  @override
  Widget build(BuildContext context) {
    bool showAsRepost = post.body.isEmpty && post.repostOf != null;
    bool visible = true;
    if (checkVisibility && !isDependency) {
      if (post.author.isBlocked) {
        visible = false;
      }
      if (post.author.isMuted) {
        visible = false;
      }
    }
    return Visibility(
      visible: visible,
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          late User user;
          if (state is Authenticated) {
            user = state.user;
          }
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) => PostDetail(
                        key: ValueKey(post.id),
                        post: showAsRepost ? post.repostOf! : post,
                        showAsRepost: showAsRepost,
                        repost: post,
                      ),
                ),
              );
            },
            child:
                showAsRepost
                    ? Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                            left: 15,
                            right: 15,
                            top: 10,
                            bottom: 5,
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Symbols.loop_rounded,
                                color: Theme.of(context).colorScheme.outline,
                              ),
                              SizedBox(width: 5),
                              Text(
                                user.id == post.author.id
                                    ? 'You reposted'
                                    : '${post.author.name} reposted',
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.outline,
                                ),
                              ),
                            ],
                          ),
                        ),
                        _PostContainer(
                          post: post.repostOf!,
                          isDependency: false,
                          showBottomThread: showBottomThread,
                        ),
                      ],
                    )
                    : (showTopThread || showBottomThread)
                    ? Stack(
                      children: [
                        Positioned(
                          // 23 -> circle avatar radius, 15 -> margin
                          left: 23 + 15,
                          top: showBottomThread ? 0 : null,
                          bottom: showBottomThread ? 0 : null,
                          child: Container(
                            margin:
                                showTopThread ? null : EdgeInsets.only(top: 10),
                            height: showBottomThread ? null : 10,
                            width: 2,
                            color: Theme.of(context).colorScheme.outlineVariant,
                          ),
                        ),
                        _PostContainer(
                          post: post,
                          isDependency: false,
                          showBottomThread: showBottomThread,
                        ),
                      ],
                    )
                    : _PostContainer(
                      post: post,
                      isDependency: isDependency,
                      showBottomThread: false,
                    ),
          );
        },
      ),
    );
  }
}

class _PostContainer extends StatelessWidget {
  const _PostContainer({
    required this.post,
    required this.isDependency,
    required this.showBottomThread,
  });

  final Post post;
  final bool isDependency;
  final bool showBottomThread;

  @override
  Widget build(BuildContext context) {
    var numberFormat = NumberFormat.compact(locale: "en_UK");
    return Container(
      padding: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 5),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color:
                (isDependency || showBottomThread)
                    ? Colors.transparent
                    : Theme.of(context).disabledColor.withAlpha(30),
          ),
        ),
      ),
      child:
          post.isDeleted
              ? PostDeletedWidget()
              : Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 23,
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    child: ProfileImage(user: post.author),
                  ),
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
                              post.author.name,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            isDependency
                                ? SizedBox.shrink()
                                : Row(
                                  children: [
                                    TimeDifferenceInfo(
                                      publishedAt: post.publishedAt,
                                    ),
                                    isDependency
                                        ? SizedBox.shrink()
                                        : PostMorePopUp(post: post),
                                  ],
                                ),
                          ],
                        ),
                        PostBody(post: post),
                        (post.repostOf == null)
                            ? SizedBox.shrink()
                            : isDependency
                            ? SizedBox.shrink()
                            : DependencyContainer(
                              child: PostTile(
                                post: post.repostOf!,
                                isDependency: true,
                              ),
                            ),
                        (post.poll == null)
                            ? SizedBox.shrink()
                            : DependencyContainer(
                              child: PollTile(
                                poll: post.poll!,
                                isChildOfPost: true,
                              ),
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
                        isDependency
                            ? SizedBox.shrink()
                            : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ReplyButton(
                                  post: post,
                                  numberFormat: numberFormat,
                                ),
                                RepostButton(
                                  post: post,
                                  numberFormat: numberFormat,
                                ),
                                LikeButton(
                                  post: post,
                                  numberFormat: numberFormat,
                                ),
                                BookmarkButton(
                                  post: post,
                                  numberFormat: numberFormat,
                                ),
                                ViewsButton(
                                  post: post,
                                  numberFormat: numberFormat,
                                ),
                              ],
                            ),
                      ],
                    ),
                  ),
                ],
              ),
    );
  }
}

class PostBody extends StatefulWidget {
  const PostBody({super.key, required this.post});

  final Post post;

  @override
  State<PostBody> createState() => _PostBodyState();
}

class _PostBodyState extends State<PostBody> {
  String suffix = '...Show more';
  bool readMore = false;

  @override
  Widget build(BuildContext context) {
    return CustomText(
      text: widget.post.body,
      style: Theme.of(context).textTheme.bodyMedium!,
      suffix: suffix,
      showAllText: readMore,
      onSuffixPressed: () {
        setState(() {
          if (readMore) {
            suffix = '...Show more';
            readMore = false;
          } else {
            suffix = '\nShow less';
            readMore = true;
          }
        });
      },
      onUserTagPressed: (userId) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder:
                (context) => ProfilePage(
                  user: widget.post.taggedUsers.firstWhere(
                    (user) => user.id == int.parse(userId),
                  ),
                ),
          ),
        );
      },
    );
  }
}

class PostDeletedWidget extends StatelessWidget {
  const PostDeletedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('This post was deleted by the author'),
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
