import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/utils/view/failure_retry_button.dart';
import 'package:democracy/app/utils/view/loading_indicator.dart';
import 'package:democracy/auth/models/user.dart';
import 'package:democracy/post/bloc/bookmarks/bookmarks_cubit.dart';
import 'package:democracy/post/view/post_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Bookmarks extends StatelessWidget {
  const Bookmarks({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bookmarks')),
      body: BlocBuilder<BookmarksCubit, BookmarksState>(
        builder: (context, state) {
          switch (state) {
            case BookmarksLoaded():
              return PostList(key: UniqueKey(), posts: state.posts);
            case BookmarksFailure():
              return FailureRetryButton(
                onPressed: () {
                  context.read<WebsocketBloc>().add(
                    WebsocketEvent.loadBookmarks(user: user),
                  );
                },
              );
            default:
              return const LoadingIndicator();
          }
        },
      ),
    );
  }
}
