import 'package:democracy/constitution/bloc/sections/sections_cubit.dart';
import 'package:democracy/constitution/models/section.dart';
import 'package:democracy/user/bloc/users/users_bloc.dart';
import 'package:democracy/user/models/user.dart';
import 'package:democracy/user/view/widgets/profile_image.dart';
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
        child: BlocBuilder<UsersBloc, UsersState>(
          builder: (context, state) {
            List<User> users = [];
            switch (state.status) {
              case UsersStatus.success:
                users = state.users.toList();
              default:
                users = [];
            }
            return ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: users.length,
              itemBuilder: (_, index) {
                final user = users[index];
                return ListTile(
                  key: ValueKey(user.id),
                  leading: ProfileImage(user: user),
                  title: Text(user.name),
                  subtitle: Text("@${user.username}"),
                  onTap: () {
                    tagController.addTag(
                      id: '${user.id}',
                      name: user.username,
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class SectionListView extends StatelessWidget {
  const SectionListView({
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
        child: BlocBuilder<SectionsCubit, SectionsState>(
          builder: (context, state) {
            List<Section> sections = [];
            switch (state) {
              case SectionsLoaded():
                sections = state.sections.toList();
              default:
                sections = [];
            }
            return ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: sections.length,
              itemBuilder: (_, index) {
                Section section = sections[index];
                return ListTile(
                  key: ValueKey(section.id),
                  title: Text(
                    section.text,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text("#${section.tag}"),
                  onTap: () {
                    tagController.addTag(
                      id: '${section.id}',
                      name: section.tag!,
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
