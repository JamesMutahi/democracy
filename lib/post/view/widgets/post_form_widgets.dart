import 'dart:async';
import 'dart:io';

import 'package:democracy/app/utils/tagging.dart';
import 'package:democracy/auth/bloc/auth/auth_bloc.dart';
import 'package:democracy/constitution/bloc/sections/sections_bloc.dart';
import 'package:democracy/user/bloc/users/users_bloc.dart';
import 'package:democracy/user/models/user.dart';
import 'package:democracy/user/view/widgets/profile_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:fluttertagger/fluttertagger.dart';
import 'package:material_symbols_icons/symbols.dart';

class PostAuthor extends StatelessWidget {
  const PostAuthor({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          late User user;
          if (state is Authenticated) {
            user = state.user;
          }
          return ProfileImage(user: user);
        },
      ),
    );
  }
}

class PostTextField extends StatelessWidget {
  const PostTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.onChanged,
  });

  final TextEditingController controller;
  final String hintText;
  final void Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 9,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        reverse: true,
        child: TextFormField(
          controller: controller,
          onChanged: onChanged,
          autofocus: true,
          // onTapOutside: (event) {
          //   FocusScope.of(context).unfocus();
          // },
          minLines: 1,
          maxLines: 7,
          keyboardType: TextInputType.multiline,
          maxLength: 500,
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
          decoration: InputDecoration(
            filled: true,
            fillColor: Theme.of(context).scaffoldBackgroundColor,
            hintText: hintText,
            hintStyle: TextStyle(color: Theme.of(context).hintColor),
            prefixIcon: null,
            prefixIconConstraints: const BoxConstraints(
              minWidth: 0,
              minHeight: 0,
            ),
            prefixStyle: TextStyle(color: Theme.of(context).primaryColor),
            contentPadding: const EdgeInsets.all(15),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}

class PostBottomNavBar extends StatefulWidget {
  const PostBottomNavBar({
    super.key,
    required this.controller,
    required this.onPickMedia,
    required this.files,
    required this.fileLimit,
  });

  final FlutterTaggerController controller;
  final VoidCallback onPickMedia;
  final List<File> files;
  final int fileLimit;

  @override
  State<PostBottomNavBar> createState() => _PostBottomNavBarState();
}

class _PostBottomNavBarState extends State<PostBottomNavBar>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _animation;

  double overlayHeight = 1;
  SearchResultView _view = SearchResultView.none;

  late StreamSubscription<bool> keyboardSubscription;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );

    _animation = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    var keyboardVisibilityController = KeyboardVisibilityController();
    keyboardSubscription = keyboardVisibilityController.onChange.listen((
      bool visible,
    ) {
      if (!visible) {
        widget.controller.dismissOverlay();
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    widget.controller.dispose();
    keyboardSubscription.cancel();
    super.dispose();
  }

  void changeOverlayHeight(int length) {
    if (length == 0) {
      overlayHeight = 1;
    }
    if (length == 1) {
      overlayHeight = 75;
    }
    if (length == 2) {
      overlayHeight = 150;
    }
    if (length == 3) {
      overlayHeight = 225;
    }
    if (length > 3) {
      overlayHeight = 300;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<UsersBloc, UsersState>(
          listener: (context, state) {
            if (state.status == UsersStatus.success) {
              setState(() {
                _view = SearchResultView.users;
                changeOverlayHeight(state.users.length);
              });
            }
          },
        ),
        BlocListener<SectionsBloc, SectionsState>(
          listener: (context, state) {
            if (state is SectionsLoaded) {
              setState(() {
                _view = SearchResultView.hashtag;
                changeOverlayHeight(state.sections.length);
              });
            }
          },
        ),
      ],
      child: FlutterTagger(
        triggerStrategy: TriggerStrategy.eager,
        controller: widget.controller,
        animationController: _animationController,
        onSearch: (query, triggerChar) {
          if (triggerChar == "@") {
            setState(() {
              _view = SearchResultView.users;
            });
            context.read<UsersBloc>().add(UsersEvent.get(searchTerm: query));
          }
          if (triggerChar == "#") {
            setState(() {
              _view = SearchResultView.hashtag;
            });
            context.read<SectionsBloc>().add(
              SectionsEvent.get(searchTerm: query),
            );
          }
        },
        triggerCharacterAndStyles: const {
          "@": TextStyle(color: Colors.blueAccent),
          "#": TextStyle(color: Colors.blueAccent),
        },
        tagTextFormatter: (id, tag, triggerCharacter) {
          return "$triggerCharacter$id#$tag#";
        },
        overlayHeight: overlayHeight,
        overlay:
            _view == SearchResultView.users
                ? UserListView(
                  tagController: widget.controller,
                  animation: _animation,
                )
                : _view == SearchResultView.hashtag
                ? SectionListView(
                  tagController: widget.controller,
                  animation: _animation,
                )
                : SizedBox.shrink(),
        builder: (context, containerKey) {
          return Container(
            key: containerKey,
            color: Theme.of(context).canvasColor,
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  PostExtraButton(
                    iconData: Symbols.gallery_thumbnail_rounded,
                    text: 'Gallery',
                    onTap:
                        widget.files.length == widget.fileLimit
                            ? () {
                              // TODO
                            }
                            : widget.onPickMedia,
                  ),
                  SizedBox(width: 15),
                  PostExtraButton(
                    iconData: Symbols.edit_calendar_rounded,
                    text: 'Schedule',
                    onTap: () {},
                  ),
                  SizedBox(width: 15),
                  PostExtraButton(
                    iconData: Symbols.location_pin_rounded,
                    text: 'Location',
                    onTap: () {},
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class PostExtraButton extends StatelessWidget {
  const PostExtraButton({
    super.key,
    required this.iconData,
    required this.text,
    required this.onTap,
  });

  final IconData iconData;
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      splashColor: Theme.of(context).colorScheme.secondaryFixedDim,
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(7),
        decoration: BoxDecoration(
          // color: Theme.of(context).canvasColor,
          border: Border.all(color: Theme.of(context).disabledColor),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Row(
          children: [
            Icon(iconData, size: 20),
            SizedBox(width: 2.5),
            Text(text),
          ],
        ),
      ),
    );
  }
}
