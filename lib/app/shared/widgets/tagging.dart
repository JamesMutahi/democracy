import 'package:democracy/post/bloc/hashtags/hashtags_bloc.dart';
import 'package:democracy/user/bloc/users/users_bloc.dart';
import 'package:democracy/user/models/user.dart';
import 'package:democracy/user/view/widgets/profile_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertagger/fluttertagger.dart';

enum SearchResultView { users, hashtag, none }

class Tagging extends StatefulWidget {
  const Tagging({
    super.key,
    required this.flutterTaggerController,
    required this.animationController,
    required this.animation,
    required this.builder,
  });

  final FlutterTaggerController flutterTaggerController;
  final AnimationController animationController;
  final Animation<Offset> animation;
  final Widget Function(BuildContext, GlobalKey<State<StatefulWidget>>) builder;

  @override
  State<Tagging> createState() => _TaggingState();
}

class _TaggingState extends State<Tagging> {
  SearchResultView _view = SearchResultView.none;
  double _overlayHeight = 300;

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<UsersBloc, UsersState>(
          listener: (context, state) {
            if (state.status == UsersStatus.success) {
              setState(() {
                _view = SearchResultView.users;
                if (state.users.isEmpty) {
                  _overlayHeight = 1;
                }
                if (state.users.length == 1) {
                  _overlayHeight = 75;
                }
                if (state.users.length == 2) {
                  _overlayHeight = 150;
                }
                if (state.users.length == 3) {
                  _overlayHeight = 225;
                }
                if (state.users.length > 3) {
                  _overlayHeight = 300;
                }
              });
            }
          },
        ),
        BlocListener<HashtagsBloc, HashtagsState>(
          listener: (context, state) {
            if (state.status == HashtagsStatus.success) {
              String searchTerm = state.searchTerm;
              final hashtags = state.hashtags;
              setState(() {
                _view = SearchResultView.hashtag;
                if (hashtags.isEmpty) {
                  _overlayHeight = 1;
                }
                if (hashtags.length == 1) {
                  _overlayHeight = searchTerm.isEmpty ? 70 : 50;
                }
                if (hashtags.length == 2) {
                  _overlayHeight = searchTerm.isEmpty ? 140 : 100;
                }
                if (hashtags.length == 3) {
                  _overlayHeight = searchTerm.isEmpty ? 210 : 150;
                }
                if (hashtags.length > 3) {
                  _overlayHeight = searchTerm.isEmpty ? 300 : 200;
                }
              });
            }
          },
        ),
      ],
      child: FlutterTagger(
        searchRegex: RegExp(r'^[a-zA-Z0-9]*$'),
        triggerStrategy: TriggerStrategy.eager,
        controller: widget.flutterTaggerController,
        animationController: widget.animationController,
        onSearch: (query, triggerChar) {
          if (triggerChar == "@") {
            setState(() => _view = SearchResultView.users);
            context.read<UsersBloc>().add(UsersEvent.get(searchTerm: query));
          }
          if (triggerChar == "#") {
            setState(() => _view = SearchResultView.hashtag);
            context.read<HashtagsBloc>().add(
              HashtagsEvent.get(searchTerm: query),
            );
          }
        },
        triggerCharacterAndStyles: const {
          "@": TextStyle(color: Colors.purpleAccent),
          "#": TextStyle(color: Colors.blueAccent),
        },
        tagTextFormatter: (id, tag, triggerCharacter) {
          return "$triggerCharacter$id#$tag#";
        },
        overlayHeight: _overlayHeight,
        overlay: _view == SearchResultView.users
            ? _UserListView(
                tagController: widget.flutterTaggerController,
                animation: widget.animation,
              )
            : _view == SearchResultView.hashtag
            ? _HashtagListView(
                tagController: widget.flutterTaggerController,
                animation: widget.animation,
              )
            : SizedBox.shrink(),
        builder: widget.builder,
      ),
    );
  }
}

class _UserListView extends StatelessWidget {
  const _UserListView({required this.tagController, required this.animation});

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
                    tagController.addTag(id: '${user.id}', name: user.username);
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

class _HashtagListView extends StatelessWidget {
  const _HashtagListView({
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
        child: BlocBuilder<HashtagsBloc, HashtagsState>(
          builder: (context, state) {
            return ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: state.hashtags.length,
              itemBuilder: (_, index) {
                final hashtag = state.hashtags[index].substring(1);
                return ListTile(
                  key: ValueKey(hashtag),
                  title: Text('#$hashtag'),
                  subtitle: state.searchTerm.isEmpty
                      ? Text(
                          'Trending',
                          style: TextStyle(
                            color: Theme.of(context).disabledColor,
                          ),
                        )
                      : SizedBox.shrink(),
                  onTap: () {
                    tagController.addTag(id: hashtag, name: hashtag);
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
