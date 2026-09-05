import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:democracy/app/shared/widgets/bottom_text_form_field.dart';
import 'package:democracy/app/shared/widgets/loader_overlay_widgets.dart';
import 'package:democracy/app/shared/widgets/snack_bar_content.dart';
import 'package:democracy/ballot/models/ballot.dart';
import 'package:democracy/chat/bloc/direct_message/direct_message_bloc.dart';
import 'package:democracy/constitution/models/section.dart';
import 'package:democracy/broadcast/models/broadcast.dart';
import 'package:democracy/petition/models/petition.dart';
import 'package:democracy/post/models/post.dart';
import 'package:democracy/survey/models/survey.dart';
import 'package:democracy/user/bloc/users/users_bloc.dart';
import 'package:democracy/user/models/user.dart';
import 'package:democracy/user/view/widgets/profile_image.dart';
import 'package:democracy/user/view/widgets/users_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latlong2/latlong.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class DirectMessage extends StatefulWidget {
  const DirectMessage({
    super.key,
    this.post,
    this.ballot,
    this.survey,
    this.petition,
    this.broadcast,
    this.section,
  });

  final Post? post;
  final Ballot? ballot;
  final Survey? survey;
  final Petition? petition;
  final Broadcast? broadcast;
  final Section? section;

  @override
  State<DirectMessage> createState() => _DirectMessageState();
}

class _DirectMessageState extends State<DirectMessage> {
  final _searchController = TextEditingController();
  final _messageController = TextEditingController();
  final _searchFocusNode = FocusNode();
  final _messageFocusNode = FocusNode();

  final _refreshController = RefreshController();
  final List<User> _selectedUsers = [];
  List<File> _media = [];
  File? _document;
  LatLng? _location;

  @override
  void initState() {
    super.initState();
    context.read<UsersBloc>().add(UsersEvent.get());
  }

  @override
  void dispose() {
    _searchController.dispose();
    _messageController.dispose();
    _searchFocusNode.dispose();
    _messageFocusNode.dispose();
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return BlocListener<DirectMessageBloc, DirectMessageState>(
      listener: (context, state) {
        if (state.status == DirectMessageStatus.success) {
          context.router.popTop();
          ScaffoldMessenger.of(context).showSnackBar(
            getSnackBar(
              context: context,
              message: 'Direct message sent',
              status: SnackBarStatus.success,
            ),
          );
        } else if (state.status == DirectMessageStatus.failure) {
          ScaffoldMessenger.of(context).showSnackBar(
            getSnackBar(
              context: context,
              message: state.error,
              status: SnackBarStatus.failure,
            ),
          );
        }
      },
      child: LoaderOverlay(
        overlayWidgetBuilder: (_) {
          return BlocBuilder<DirectMessageBloc, DirectMessageState>(
            builder: (context, state) {
              return state.status == DirectMessageStatus.failure
                  ? LoaderOverlayFailure(
                      onRetry: () => context.read<DirectMessageBloc>().add(
                        DirectMessageEvent.retry(),
                      ),
                    )
                  : LoaderOverlayLoading(progress: state.progress);
            },
          );
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text('New Message'),
            leading: IconButton(
              icon: const Icon(Icons.close_rounded),
              onPressed: () => context.router.popTop(),
            ),
            centerTitle: true,
            elevation: 0,
            scrolledUnderElevation: 0,
          ),
          body: Column(
            children: [
              // 1. Recipients & Search Area
              Container(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
                decoration: BoxDecoration(
                  color: colorScheme.surface,
                  border: Border(
                    bottom: BorderSide(
                      color: colorScheme.outlineVariant.withValues(alpha: 0.5),
                    ),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (_selectedUsers.isNotEmpty) ...[
                      Wrap(
                        spacing: 8,
                        runSpacing: 4,
                        children: _selectedUsers
                            .map(
                              (user) => _RecipientChip(
                                user: user,
                                onDeleted: () =>
                                    setState(() => _selectedUsers.remove(user)),
                              ),
                            )
                            .toList(),
                      ),
                      const SizedBox(height: 8),
                    ],
                    TextField(
                      controller: _searchController,
                      focusNode: _searchFocusNode,
                      autofocus: true,
                      onChanged: (value) {
                        context.read<UsersBloc>().add(
                          UsersEvent.get(searchTerm: value),
                        );
                      },
                      onTapOutside: (_) =>
                          FocusManager.instance.primaryFocus?.unfocus(),
                      decoration: InputDecoration(
                        hintText: _selectedUsers.isEmpty
                            ? 'Search people...'
                            : 'Add more people...',
                        hintStyle: TextStyle(
                          color: colorScheme.onSurfaceVariant,
                        ),
                        prefixIcon: Icon(
                          Icons.search_rounded,
                          color: colorScheme.onSurfaceVariant,
                        ),
                        filled: true,
                        fillColor: colorScheme.surfaceContainerHighest,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 0,
                          horizontal: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // 2. User List
              Expanded(
                child: BlocBuilder<UsersBloc, UsersState>(
                  builder: (context, state) {
                    final users = state.users.toList();

                    if (state.status == UsersStatus.success) {
                      if (_refreshController.headerStatus ==
                          RefreshStatus.refreshing) {
                        _refreshController.refreshCompleted();
                      }
                      if (_refreshController.footerStatus ==
                          LoadStatus.loading) {
                        _refreshController.loadComplete();
                      }
                    } else if (state.status == UsersStatus.failure) {
                      if (_refreshController.headerStatus ==
                          RefreshStatus.refreshing) {
                        _refreshController.refreshFailed();
                      }
                      if (_refreshController.footerStatus ==
                          LoadStatus.loading) {
                        _refreshController.loadFailed();
                      }
                    }

                    return UsersListView(
                      users: users,
                      selectedUsers: _selectedUsers,
                      loading:
                          state.status == UsersStatus.initial ||
                          state.status == UsersStatus.loading,
                      failure: users.isNotEmpty
                          ? false
                          : state.status == UsersStatus.failure,
                      refreshController: _refreshController,
                      enablePullUp: state.hasNext,
                      onUserTap: (user) {
                        setState(() {
                          if (_selectedUsers.contains(user)) {
                            _selectedUsers.remove(user);
                          } else {
                            _selectedUsers.add(user);
                          }
                        });
                      },
                      onLoading: () {
                        if (users.isNotEmpty) {
                          context.read<UsersBloc>().add(
                            UsersEvent.get(
                              searchTerm: _searchController.text,
                              lastUser: users.last,
                            ),
                          );
                        }
                      },
                      onFailure: () {
                        if (users.isNotEmpty) {
                          context.read<UsersBloc>().add(
                            UsersEvent.get(
                              searchTerm: _searchController.text,
                              lastUser: users.last,
                            ),
                          );
                        }
                      },
                    );
                  },
                ),
              ),
            ],
          ),
          bottomNavigationBar: BottomTextFormField(
            focusNode: _messageFocusNode,
            showCursor: true,
            readOnly: false,
            controller: _messageController,
            onTap: () {},
            onChanged: (value) {},
            hintText: 'Add a comment',
            prefixIcon: null,
            onMedia: (media) => setState(() => _media = media),
            media: _media,
            onAddMedia: (media) => setState(() => _media.addAll(media)),
            onRemoveMedia: (index) => setState(() => _media.removeAt(index)),
            onDocument: (file) => setState(() => _document = file),
            document: _document,
            onContentInsertion: (imageFile) =>
                setState(() => _media.add(imageFile)),
            allowedMimeTypes: const <String>['image/png', 'image/gif'],
            onLocation: (point) => _location = point,
            location: _location,
            onRemoveLocation: () => setState(() => _location = null),
            onSectionSelection: (section) {},
            section: null,
            onRemoveSection: () {},
            onImageEditingComplete: (file) => setState(() => _media.add(file)),
            onVideoEditingComplete: (path) =>
                setState(() => _media.add(File(path))),
            onSend: _selectedUsers.isEmpty
                ? null
                : () {
                    context.loaderOverlay.show();
                    context.read<DirectMessageBloc>().add(
                      DirectMessageEvent.send(
                        users: _selectedUsers,
                        text: _messageController.text,
                        post: widget.post,
                        ballot: widget.ballot,
                        survey: widget.survey,
                        petition: widget.petition,
                        broadcast: widget.broadcast,
                        section: widget.section,
                        filePaths: [
                          ..._media.map((m) => m.path),
                          if (_document != null) _document!.path,
                        ],
                        location: _location,
                      ),
                    );
                    Future.delayed(const Duration(seconds: 10), () {
                      if (context.mounted) {
                        context.loaderOverlay.hide();
                      }
                    });
                  },
          ),
        ),
      ),
    );
  }
}

class _RecipientChip extends StatelessWidget {
  const _RecipientChip({required this.user, required this.onDeleted});

  final User user;
  final VoidCallback onDeleted;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ProfileImage(
            userId: user.id,
            username: user.username,
            imageUrl: user.image,
            radius: 12,
          ),
          const SizedBox(width: 8),
          Text(
            user.name,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
          ),
          const SizedBox(width: 4),
          InkWell(
            onTap: onDeleted,
            borderRadius: BorderRadius.circular(12),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Icon(
                Icons.close_rounded,
                size: 14,
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
