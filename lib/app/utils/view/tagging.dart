import 'package:democracy/app/utils/view/profile_image.dart';
import 'package:democracy/auth/models/user.dart';
import 'package:democracy/chat/bloc/search_users/search_users_cubit.dart';
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
      title: Text(user.displayName),
      subtitle: Text("@${user.displayName}"),
      onTap: () async {
        tagController.addTag(id: user.id.toString(), name: user.displayName);
      },
    );
  }
}

List<User> allUsers = [
  User(
    id: 3,
    name: 'Generali',
    displayName: 'Generali',
    email: 'g@gmail.com',
    image: 'http://192.168.152.106:8000/media/profile_pics/default.jpg',
    status: '',
    muted: [],
    blocked: [],
    following: 0,
    followers: 0,
    isActive: true,
    dateJoined: DateTime.now(),
  ),
  User(
    id: 4,
    name: 'Jangili',
    displayName: 'Jangili',
    email: 'Jangili@gmail.com',
    image: 'http://192.168.152.106:8000/media/profile_pics/default.jpg',
    status: '',
    muted: [],
    blocked: [],
    following: 0,
    followers: 0,
    isActive: true,
    dateJoined: DateTime.now(),
  ),
  User(
    id: 5,
    name: 'Jambazi',
    displayName: 'Jambazi',
    email: 'Jambazi@gmail.com',
    image: 'http://192.168.152.106:8000/media/profile_pics/default.jpg',
    status: '',
    muted: [],
    blocked: [],
    following: 0,
    followers: 0,
    isActive: true,
    dateJoined: DateTime.now(),
  ),
];
