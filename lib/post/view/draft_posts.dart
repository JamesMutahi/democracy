import 'package:democracy/app/utils/bottom_loader.dart';
import 'package:democracy/app/utils/failure_retry_button.dart';
import 'package:democracy/post/bloc/draft_posts/draft_posts_bloc.dart';
import 'package:democracy/post/models/post.dart';
import 'package:democracy/post/view/post_update.dart';
import 'package:democracy/post/view/widgets/post_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class DraftPosts extends StatefulWidget {
  const DraftPosts({super.key});

  @override
  State<DraftPosts> createState() => _DraftsPostsState();
}

class _DraftsPostsState extends State<DraftPosts> {
  bool loading = true;
  bool failure = false;
  List<Post> _posts = [];
  bool hasNextPage = false;
  final RefreshController _refreshController = RefreshController(
    initialRefresh: false,
  );

  @override
  void initState() {
    context.read<DraftPostsBloc>().add(DraftPostsEvent.get());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Drafts')),
      body: MultiBlocListener(
        listeners: [
          BlocListener<DraftPostsBloc, DraftPostsState>(
            listener: (context, state) {
              if (state.status == DraftPostsStatus.success) {
                setState(() {
                  _posts = state.posts.toList();
                  loading = false;
                  failure = false;
                  hasNextPage = state.hasNext;
                  if (_refreshController.headerStatus ==
                      RefreshStatus.refreshing) {
                    _refreshController.refreshCompleted();
                  }
                  if (_refreshController.footerStatus ==
                      LoadStatus.loading) {
                    _refreshController.loadComplete();
                  }
                });
              }
              if (state.status == DraftPostsStatus.failure) {
                if (loading) {
                  setState(() {
                    loading = false;
                    failure = true;
                  });
                }
                if (_refreshController.headerStatus ==
                    RefreshStatus.refreshing) {
                  _refreshController.refreshFailed();
                }
                if (_refreshController.footerStatus ==
                    LoadStatus.loading) {
                  _refreshController.loadFailed();
                }
              }
            },
          ),
        ],
        child: SmartRefresher(
          enablePullDown: true,
          enablePullUp: hasNextPage,
          header: ClassicHeader(),
          controller: _refreshController,
          onRefresh: () {
            context.read<DraftPostsBloc>().add(DraftPostsEvent.get());
          },
          onLoading: () {
            context.read<DraftPostsBloc>().add(
              DraftPostsEvent.get(previousPosts: _posts),
            );
          },
          footer: ClassicFooter(),
          child: PostListener(
            posts: _posts,
            onPostsUpdated: (posts) {
              setState(() {
                _posts = posts;
              });
            },
            child:
            loading
                ? Container(
              margin: EdgeInsets.only(top: 50),
              child: BottomLoader(),
            )
                : failure
                ? FailureRetryButton(
              onPressed: () {
                context.read<DraftPostsBloc>().add(
                  DraftPostsEvent.get(),
                );
              },
            )
                : ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 15),
              itemBuilder: (BuildContext context, int index) {
                Post post = _posts[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => PostUpdate(post: post),
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    child: Text(post.body),
                  ),
                );
              },
              itemCount: _posts.length,
            ),
          ),
        ),
      ),
    );
  }
}
