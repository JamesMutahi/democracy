import 'dart:async';

import 'package:democracy/app/shared/utils/custom_editing_controller.dart';
import 'package:democracy/post/bloc/hashtags/hashtags_bloc.dart';
import 'package:democracy/user/bloc/users/users_bloc.dart';
import 'package:democracy/user/view/widgets/profile_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum SearchResultView { users, hashtag, none }

class Tagging extends StatefulWidget {
  const Tagging({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.child,
  });

  final CustomEditingController controller;
  final FocusNode focusNode;
  final Widget child;

  @override
  State<Tagging> createState() => _TaggingState();
}

class _TaggingState extends State<Tagging> {
  final _overlayPortalController = OverlayPortalController();
  final _layerLink = LayerLink();
  SearchResultView _view = SearchResultView.none;

  late final VoidCallback _listener;
  String? _currentSearchTerm;
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _listener = _onTextChanged;
    widget.controller.addListener(_listener);
  }

  @override
  void dispose() {
    _debounce?.cancel();
    widget.controller.removeListener(_listener);
    super.dispose();
  }

  void _onTextChanged() {
    final controller = widget.controller;
    final selection = controller.selection;

    if (!selection.isValid || !selection.isCollapsed) {
      _hideOverlay();
      return;
    }

    final cursorPos = selection.baseOffset;
    final text = controller.text;

    final token = _getCurrentToken(text, cursorPos);

    if (token == null || token.length <= 1) {
      _hideOverlay();
      return;
    }

    final isHashtag = token.startsWith('#');
    final searchTerm = token.substring(1);

    if (searchTerm == _currentSearchTerm) return;

    _currentSearchTerm = searchTerm;

    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 250), () {
      if (!mounted) return;
      if (isHashtag) {
        context.read<HashtagsBloc>().add(
          HashtagsEvent.get(searchTerm: searchTerm), // ← Confirm this event
        );
      } else {
        context.read<UsersBloc>().add(UsersEvent.get(searchTerm: searchTerm));
      }
      _showOverlay(
        isHashtag ? SearchResultView.hashtag : SearchResultView.users,
      );
    });
  }

  String? _getCurrentToken(String text, int cursorPos) {
    if (cursorPos <= 0) return null;

    // Start from the character just before cursor
    int start = cursorPos - 1;

    // Move backwards until we hit whitespace OR the beginning
    while (start >= 0 && !RegExp(r'[\s]').hasMatch(text[start])) {
      start--;
    }
    start++; // Move to the first character of the potential token

    if (start >= cursorPos) return null;

    final token = text.substring(start, cursorPos);

    // Must start with @ or # and be followed by valid characters
    if (RegExp(r'^[@#][a-zA-Z0-9_]*$').hasMatch(token)) {
      return token;
    }

    return null;
  }

  void _showOverlay(SearchResultView view) {
    if (!mounted) return;

    setState(() => _view = view);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_overlayPortalController.isShowing) {
        _overlayPortalController.show();
      }
    });
  }

  void _hideOverlay() {
    if (!mounted) return;
    _currentSearchTerm = null;
    _debounce?.cancel();

    if (_overlayPortalController.isShowing) {
      _overlayPortalController.hide();
    }
    if (_view != SearchResultView.none) {
      setState(() => _view = SearchResultView.none);
    }
  }

  void _insertText(String text) {
    final controller = widget.controller;
    final cursorPos = controller.selection.baseOffset;
    final token =
        _getCurrentToken(controller.text, cursorPos) ?? text; // fallback

    final newText = controller.text.replaceRange(
      cursorPos - (token.length > 1 ? token.length : 0),
      cursorPos,
      text,
    );

    controller.value = TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(
        offset: cursorPos - (token.length > 1 ? token.length : 0) + text.length,
      ),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.focusNode.requestFocus();
      _hideOverlay();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<UsersBloc, UsersState>(
          listener: (context, state) {
            if (state.status == UsersStatus.success) {
              setState(() => _view = SearchResultView.users);
            }
          },
        ),
        BlocListener<HashtagsBloc, HashtagsState>(
          listener: (context, state) {
            if (state.status == HashtagsStatus.success) {
              setState(() => _view = SearchResultView.hashtag);
            }
          },
        ),
      ],
      child: CompositedTransformTarget(
        link: _layerLink,
        child: OverlayPortal(
          controller: _overlayPortalController,
          overlayChildBuilder: (context) {
            return Positioned(
              left: 16,
              child: CompositedTransformFollower(
                offset: const Offset(0, -20),
                link: _layerLink,
                targetAnchor: Alignment.bottomLeft,
                followerAnchor: Alignment.topLeft,
                child: Material(
                  elevation: 8,
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  color: Theme.of(context).canvasColor,
                  child: Container(
                    constraints: BoxConstraints(
                      maxHeight: MediaQuery.sizeOf(context).height * 0.4,
                      maxWidth: 300,
                    ),
                    child: TapRegion(
                      onTapOutside: (_) => _hideOverlay(),
                      child: _view == SearchResultView.users
                          ? _UserListView(
                              textEditingController: widget.controller,
                              onSelected: (value) => _insertText(value),
                            )
                          : _HashtagListView(
                              textEditingController: widget.controller,
                              onSelected: (value) => _insertText(value),
                            ),
                    ),
                  ),
                ),
              ),
            );
          },
          child: widget.child,
        ),
      ),
    );
  }
}

class _UserListView extends StatelessWidget {
  const _UserListView({
    required this.textEditingController,
    required this.onSelected,
  });

  final CustomEditingController textEditingController;
  final ValueChanged<String> onSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: BlocBuilder<UsersBloc, UsersState>(
        builder: (context, state) {
          return ListView.builder(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: state.users.length,
            itemBuilder: (_, index) {
              final user = state.users[index];
              return ListTile(
                key: ValueKey(user.id),
                leading: ProfileImage(user: user),
                title: Text(user.name),
                subtitle: Text("@${user.username}"),
                onTap: () {
                  onSelected("@${user.username} ");
                },
              );
            },
          );
        },
      ),
    );
  }
}

class _HashtagListView extends StatelessWidget {
  const _HashtagListView({
    required this.textEditingController,
    required this.onSelected,
  });

  final CustomEditingController textEditingController;
  final ValueChanged<String> onSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: BlocBuilder<HashtagsBloc, HashtagsState>(
        builder: (context, state) {
          return ListView.builder(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
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
                  onSelected('#$hashtag ');
                },
              );
            },
          );
        },
      ),
    );
  }
}
