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
    context.read<PostBloc>().add(PostEvent.initialize());
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
                  padding: const EdgeInsets.only(
                    left: 20.0,
                    right: 20.0,
                    bottom: 160,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return index >= posts.length
                        ? const BottomLoader()
                        : PostTile(key: ValueKey(index), post: posts[index]);
                  },
                  itemCount:
                      state.next == null ? posts.length : posts.length + 1,
                )
                : const NoResults();
          case PostStatus.failure:
            return FailureRetryButton(
              onPressed: () {
                context.read<PostBloc>().add(const PostEvent.reload());
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
    return ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PostDetail()),
        );
      },
      title: Text(post.body),
      trailing: Icon(Icons.arrow_forward_ios),
      leading: Container(
        width: 5,
        margin: EdgeInsets.symmetric(vertical: 2.5),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.all(Radius.circular(50.0)),
        ),
      ),
    );
  }
}
