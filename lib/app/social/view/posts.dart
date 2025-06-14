import 'package:democracy/app/social/bloc/post/post_bloc.dart';
import 'package:democracy/app/social/bloc/post_list/post_list_cubit.dart';
import 'package:democracy/app/social/models/post.dart';
import 'package:democracy/app/social/view/post_detail.dart';
import 'package:democracy/app/utils/view/bottom_loader.dart';
import 'package:democracy/app/utils/view/failure_retry_button.dart';
import 'package:democracy/app/utils/view/loading_indicator.dart';
import 'package:democracy/app/utils/view/no_results.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/symbols.dart';

class Posts extends StatefulWidget {
  const Posts({super.key});

  @override
  State<Posts> createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PostBloc, PostState>(
      listener: (context, state) {
        if (state.message['action'] == 'list') {
          context.read<PostListCubit>().loadPosts(message: state.message);
        }
      },
      child: BlocBuilder<PostListCubit, PostListState>(
        builder: (context, state) {
          switch (state) {
            case PostListLoaded():
              List<Post> posts = state.posts;
              return (posts.isNotEmpty)
                  ? ListView.builder(
                    controller: _scrollController,
                    scrollDirection: Axis.vertical,
                    padding: const EdgeInsets.only(bottom: 160),
                    itemBuilder: (BuildContext context, int index) {
                      return index >= posts.length
                          ? (posts.length > 2)
                              ? const BottomLoader()
                              : SizedBox.shrink()
                          : PostTile(key: ValueKey(index), post: posts[index]);
                    },
                    itemCount: posts.length,
                  )
                  : const NoResults();
            case PostListFailure():
              return FailureRetryButton(
                onPressed: () {
                  context.read<PostBloc>().add(const PostEvent.initialize());
                },
              );
            default:
              return const LoadingIndicator();
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    // if (_isBottom) context.read<PostBloc>().add(PostEvent.bottomReached());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    if (_scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      return false;
    }
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}

class PostTile extends StatelessWidget {
  const PostTile({super.key, required this.post, this.isRepost = false});

  final Post post;
  final bool isRepost;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PostDetail(post: post)),
        );
      },
      child: Container(
        padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color:
                  (isRepost)
                      ? Colors.transparent
                      : Theme.of(context).disabledColor.withAlpha(30),
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${post.author.firstName} ${post.author.lastName}',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      isRepost
                          ? SizedBox.shrink()
                          : Row(
                            children: [
                              TimeDifferenceInfo(publishedAt: post.publishedAt),
                              PostTileButton(
                                iconData: Symbols.more_vert_rounded,
                              ),
                            ],
                          ),
                    ],
                  ),
                  Text(
                    post.body,
                    overflow: isRepost ? TextOverflow.ellipsis : null,
                    maxLines:
                        isRepost
                            ? 4
                            : (post.image1Url == null)
                            ? 20
                            : 10,
                  ),
                  (post.repostOf == null)
                      ? SizedBox.shrink()
                      : Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(
                              context,
                            ).disabledColor.withAlpha(30),
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: PostTile(post: post.repostOf!, isRepost: true),
                      ),
                  isRepost
                      ? SizedBox.shrink()
                      : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          PostTileButton(
                            iconData: Symbols.message_rounded,
                            trailing:
                                (post.replies > 0)
                                    ? post.replies.toString()
                                    : null,
                          ),
                          PostTileButton(
                            iconData: Symbols.sync_rounded,
                            trailing:
                                (post.reposts > 0)
                                    ? post.reposts.toString()
                                    : null,
                          ),
                          PostTileButton(
                            iconData: Symbols.favorite_rounded,
                            trailing:
                                (post.likes > 0) ? post.likes.toString() : null,
                          ),
                          PostTileButton(
                            iconData: Symbols.poll_rounded,
                            trailing:
                                (post.views > 0) ? post.views.toString() : null,
                          ),
                          Row(
                            children: [
                              PostTileButton(
                                iconData: Symbols.bookmark_rounded,
                              ),
                              PostTileButton(iconData: Symbols.share_rounded),
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

class PostTileButton extends StatelessWidget {
  const PostTileButton({super.key, required this.iconData, this.trailing});

  final IconData iconData;
  final String? trailing;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {},
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(7.5),
            child: Icon(
              iconData,
              size: 20,
              color: Theme.of(context).disabledColor,
            ),
          ),
        ),
        (trailing == null)
            ? SizedBox.shrink()
            : Text(
              trailing!,
              style: TextStyle(color: Theme.of(context).disabledColor),
            ),
      ],
    );
  }
}

class TimeDifferenceInfo extends StatelessWidget {
  const TimeDifferenceInfo({super.key, required this.publishedAt});

  final DateTime publishedAt;

  @override
  Widget build(BuildContext context) {
    var currentTime = DateTime.now();
    var diff = currentTime.difference(publishedAt);
    final diffSeconds = diff.inSeconds;
    var unit = 's';
    var difference = diffSeconds;
    if (diffSeconds > 1 || diffSeconds < 1) {
      unit = 's';
    }
    if (diffSeconds > 60) {
      final diffMinutes = diff.inMinutes;
      difference = diffMinutes;
      unit = 'min';
      if (diffMinutes > 1) {
        unit = 'min';
      }
      if (diffMinutes > 60) {
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

    return Text(
      '$difference$unit',
      style: TextStyle(color: Theme.of(context).disabledColor),
    );
  }
}
