import 'package:democracy/app/utils/view/bottom_loader.dart';
import 'package:democracy/app/utils/view/failure_retry_button.dart';
import 'package:democracy/post/models/post.dart';
import 'package:democracy/post/view/widgets/post_tile.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class PostListView extends StatelessWidget {
  const PostListView({
    super.key,
    this.physics,
    required this.posts,
    required this.loading,
    required this.failure,
    required this.refreshController,
    required this.enablePullDown,
    required this.enablePullUp,
    required this.onRefresh,
    required this.onLoading,
    required this.onFailure,
  });

  final ScrollPhysics? physics;
  final List<Post> posts;
  final bool loading;
  final bool failure;
  final RefreshController refreshController;
  final bool enablePullDown;
  final bool enablePullUp;
  final VoidCallback onRefresh;
  final VoidCallback onLoading;
  final VoidCallback onFailure;

  @override
  Widget build(BuildContext context) {
    return loading
        ? Container(margin: EdgeInsets.only(top: 20), child: BottomLoader())
        : failure
        ? FailureRetryButton(onPressed: onFailure)
        : SmartRefresher(
          enablePullDown: false,
          enablePullUp: enablePullUp,
          header: ClassicHeader(),
          controller: refreshController,
          onRefresh: onRefresh,
          onLoading: onLoading,
          footer: ClassicFooter(),
          child: ListView.builder(
            physics: physics,
            itemBuilder: (BuildContext context, int index) {
              Post post = posts[index];
              return PostTile(key: ValueKey(post.id), post: post);
            },
            itemCount: posts.length,
          ),
        );
  }
}
