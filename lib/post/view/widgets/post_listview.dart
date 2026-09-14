import 'package:democracy/app/shared/widgets/bottom_loader.dart';
import 'package:democracy/app/shared/widgets/failure_retry_button.dart';
import 'package:democracy/app/shared/widgets/no_results.dart';
import 'package:democracy/post/models/post.dart';
import 'package:democracy/post/view/utils/add_post_view.dart';
import 'package:democracy/post/view/widgets/post_listener.dart';
import 'package:democracy/post/view/widgets/post_widget_selector.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class PostListView extends StatelessWidget {
  const PostListView({
    super.key,
    required this.posts,
    required this.loading,
    required this.failure,
    required this.refreshController,
    required this.enablePullDown,
    required this.enablePullUp,
    this.checkVisibility = false,
    this.showPin = false,
    required this.onPostsUpdated,
    required this.onRefresh,
    required this.onLoading,
    required this.onFailure,
    required this.origin,
    this.scrollController,
    this.physics,
  });

  final List<Post> posts;
  final bool loading;
  final bool failure;
  final RefreshController refreshController;
  final bool enablePullDown;
  final bool enablePullUp;
  final bool showPin;
  final bool checkVisibility;
  final void Function(List<Post>) onPostsUpdated;
  final VoidCallback onRefresh;
  final VoidCallback onLoading;
  final VoidCallback onFailure;
  final String? origin;
  final ScrollController? scrollController;
  final ScrollPhysics? physics;

  @override
  Widget build(BuildContext context) {
    return loading
        ? Container(margin: EdgeInsets.only(top: 20), child: BottomLoader())
        : failure
        ? FailureRetryButton(onPressed: onFailure)
        : PostListener(
            posts: posts,
            onPostsUpdated: onPostsUpdated,
            child: SmartRefresher(
              enablePullDown: enablePullDown,
              enablePullUp: enablePullUp,
              header: const ClassicHeader(),
              controller: refreshController,
              onRefresh: onRefresh,
              onLoading: onLoading,
              footer: const ClassicFooter(),
              child: posts.isEmpty
                  ? const NoResults(text: 'No results')
                  : ListView.builder(
                      controller: scrollController,
                      physics: physics,
                      padding: const EdgeInsets.only(bottom: 20),
                      itemBuilder: (BuildContext context, int index) {
                        Post post = posts[index];
                        return PostWidgetSelector(
                          key: ValueKey(post.id),
                          post: post,
                          isDependency: false,
                          checkVisibility: checkVisibility,
                          showPin: showPin && post.isPinned,
                          onViewed: () {
                            if (origin != null) {
                              addPostView(context, origin!, post);
                            }
                          },
                        );
                      },
                      itemCount: posts.length,
                    ),
            ),
          );
  }
}
