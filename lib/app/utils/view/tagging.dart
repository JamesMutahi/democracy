import 'package:democracy/app/utils/view/profile_image.dart';
import 'package:democracy/auth/models/user.dart';
import 'package:democracy/users/bloc/search_users/search_users_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertagger/fluttertagger.dart';

enum SearchResultView { users, hashtag, none }

class UserListView extends StatelessWidget {
  const UserListView({
    super.key,
    required this.tagController,
    required this.animation,
  });

  final FlutterTaggerController tagController;
  final Animation<Offset> animation;

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: animation,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 2),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Theme.of(context).canvasColor,
        ),
        child: BlocBuilder<SearchUsersCubit, SearchUsersState>(
          builder: (context, state) {
            List<User> users = [];
            switch (state) {
              case SearchUsersLoaded():
                users = state.users.toList();
              default:
                users = [];
            }
            return ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: users.length,
              itemBuilder: (_, index) {
                final user = users[index];
                return UserTile(
                  key: ValueKey(user.id),
                  user: user,
                  tagController: tagController,
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class UserTile extends StatelessWidget {
  const UserTile({super.key, required this.user, required this.tagController});

  final User user;
  final FlutterTaggerController tagController;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ProfileImage(user: user),
      title: Text(user.name),
      subtitle: Text("@${user.username}"),
      onTap: () async {
        tagController.addTag(id: user.id.toString(), name: user.username);
      },
    );
  }
}
