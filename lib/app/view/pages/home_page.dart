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
  void initState() {
    context.read<WebsocketBloc>().add(WebsocketEvent.getPosts());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
                      child: Icon(
                        Symbols.post_add_rounded,
                        size: 20,
                      ),
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
