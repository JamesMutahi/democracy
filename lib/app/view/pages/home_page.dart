import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/post/bloc/post_list/post_list_cubit.dart';
import 'package:democracy/post/view/post_create.dart';
import 'package:democracy/post/view/post_list.dart';
import 'package:democracy/app/utils/view/failure_retry_button.dart';
import 'package:democracy/app/utils/view/loading_indicator.dart';
import 'package:democracy/app/utils/view/no_results.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/symbols.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          const TabBar(tabs: [Tab(text: 'For You'), Tab(text: 'Following')]),
          const SizedBox(height: 10),
          Expanded(
            child: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              children: [ForYouTab(), FollowingTab()],
            ),
          ),
        ],
      ),
    );
  }
}

class ForYouTab extends StatelessWidget {
  const ForYouTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostListCubit, PostListState>(
      builder: (context, state) {
        switch (state) {
          case PostListLoaded(:final posts):
            return Stack(
              children: [
                (posts.isNotEmpty)
                    ? PostList(key: UniqueKey(), posts: posts)
                    : NoResults(text: 'No posts'),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    margin: EdgeInsets.only(right: 10, bottom: 10),
                    child: FloatingActionButton(
                      heroTag: 'posts',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PostCreate()),
                        );
                      },
                      mini: true,
                      child: Icon(Symbols.post_add_rounded),
                    ),
                  ),
                ),
              ],
            );
          case PostListFailure():
            return FailureRetryButton(
              onPressed: () {
                context.read<WebsocketBloc>().add(WebsocketEvent.connect());
              },
            );
          default:
            return const LoadingIndicator();
        }
      },
    );
  }
}

class FollowingTab extends StatelessWidget {
  const FollowingTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
