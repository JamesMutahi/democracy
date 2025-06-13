import 'package:democracy/app/social/bloc/post/post_bloc.dart';
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
    return BlocBuilder<PostBloc, PostState>(
      builder: (context, state) {
        switch (state.status) {
          case PostStatus.success:
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
                  itemCount:
                      state.next == null ? posts.length : posts.length + 1,
                )
                : const NoResults();
          case PostStatus.failure:
            return FailureRetryButton(
              onPressed: () {
                context.read<PostBloc>().add(const PostEvent.initialize());
              },
            );
          default:
            return const LoadingIndicator();
        }
      },
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) context.read<PostBloc>().add(GetPosts());
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
  const PostTile({super.key, required this.post});

  final Post post;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PostDetail()),
        );
      },
      child: Container(
        padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Theme.of(context).disabledColor.withAlpha(10),
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
                  Text(
                    '${post.author.firstName} ${post.author.lastName}',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(post.body),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PostTileButton(
                        iconData: Symbols.message_rounded,
                        trailing: post.replies.toString(),
                      ),
                      PostTileButton(
                        iconData: Symbols.sync_rounded,
                        trailing: '734',
                      ),
                      PostTileButton(
                        iconData: Symbols.favorite_rounded,
                        trailing: post.likes.toString(),
                      ),
                      PostTileButton(
                        iconData: Symbols.poll_rounded,
                        trailing: post.views.toString(),
                      ),
                      PostTileButton(iconData: Symbols.share_rounded),
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
        SizedBox(width: 3),
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
