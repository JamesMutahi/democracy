import 'dart:io';

import 'package:democracy/app/shared/widgets/bottom_text_form_field.dart';
import 'package:democracy/app/shared/widgets/snack_bar_content.dart';
import 'package:democracy/ballot/models/ballot.dart';
import 'package:democracy/chat/bloc/chat_detail/chat_detail_bloc.dart';
import 'package:democracy/constitution/models/section.dart';
import 'package:democracy/meet/models/meeting.dart';
import 'package:democracy/petition/models/petition.dart';
import 'package:democracy/post/models/post.dart';
import 'package:democracy/survey/models/survey.dart';
import 'package:democracy/user/bloc/users/users_bloc.dart';
import 'package:democracy/user/models/user.dart';
import 'package:democracy/user/view/widgets/users_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latlong2/latlong.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class DirectMessage extends StatefulWidget {
  const DirectMessage({
    super.key,
    required this.post,
    required this.ballot,
    required this.survey,
    required this.petition,
    this.meeting,
    this.section,
  });

  final Post? post;
  final Ballot? ballot;
  final Survey? survey;
  final Petition? petition;
  final Meeting? meeting;
  final Section? section;

  @override
  State<DirectMessage> createState() => _DirectMessageState();
}

class _DirectMessageState extends State<DirectMessage> {
  TextEditingController controller = TextEditingController();
  FocusNode focusNode = FocusNode();
  List<User> selectedUsers = [];
  final RefreshController _refreshController = RefreshController();
  List<File> _selectedImages = [];
  File? _selectedFile;
  File? _insertedContent;
  LatLng? location;

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  void initState() {
    context.read<UsersBloc>().add(UsersEvent.get());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ChatDetailBloc, ChatDetailState>(
      listener: (context, state) {
        if (state is DirectMessageSent) {
          Navigator.pop(context);
          final snackBar = getSnackBar(
            context: context,
            message: 'Direct message sent',
            status: SnackBarStatus.success,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          automaticallyImplyLeading: false,
          title: Text('Send via Direct Message'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Theme.of(context).colorScheme.outline,
                    width: 1.0,
                  ),
                  top: BorderSide(
                    color: Theme.of(context).colorScheme.outline,
                    width: 1.0,
                  ),
                ),
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    if (selectedUsers.isNotEmpty)
                      ...selectedUsers.map((user) {
                        return Container(
                          margin: EdgeInsets.only(right: 2.5),
                          child: InputChip(
                            label: Text(user.name),
                            deleteIcon: Icon(Icons.close),
                            onDeleted: () {
                              setState(() {
                                selectedUsers.remove(user);
                              });
                            },
                            showCheckmark: true,
                          ),
                        );
                      }),
                    SizedBox(
                      width: selectedUsers.length < 2
                          ? MediaQuery.of(context).size.width
                          : 200,
                      child: TextFormField(
                        onChanged: (value) {
                          context.read<UsersBloc>().add(
                            UsersEvent.get(searchTerm: value),
                          );
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Theme.of(context).scaffoldBackgroundColor,
                          hintText: selectedUsers.isEmpty
                              ? 'Search for people'
                              : null,
                          hintStyle: TextStyle(
                            color: Theme.of(context).hintColor,
                          ),
                          prefixIcon: selectedUsers.isEmpty
                              ? Icon(Symbols.search_rounded)
                              : null,
                          prefixIconConstraints: const BoxConstraints(
                            minWidth: 0,
                            minHeight: 0,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: BlocBuilder<UsersBloc, UsersState>(
                builder: (context, state) {
                  final users = state.users.toList();

                  if (state.status == UsersStatus.success) {
                    if (_refreshController.headerStatus ==
                        RefreshStatus.refreshing) {
                      _refreshController.refreshCompleted();
                    }
                    if (_refreshController.footerStatus == LoadStatus.loading) {
                      _refreshController.loadComplete();
                    }
                  }

                  if (state.status == UsersStatus.failure) {
                    if (_refreshController.headerStatus ==
                        RefreshStatus.refreshing) {
                      _refreshController.refreshFailed();
                    }
                    if (_refreshController.footerStatus == LoadStatus.loading) {
                      _refreshController.loadFailed();
                    }
                  }

                  return UsersListView(
                    users: users,
                    selectedUsers: selectedUsers,
                    loading:
                        state.status == UsersStatus.initial ||
                        state.status == UsersStatus.loading,
                    failure: state.users.isNotEmpty
                        ? false
                        : state.status == UsersStatus.failure,
                    refreshController: _refreshController,
                    enablePullUp: state.hasNext,
                    onUserTap: (user) {
                      setState(() {
                        if (selectedUsers.contains(user)) {
                          selectedUsers.remove(user);
                        } else {
                          selectedUsers.add(user);
                        }
                      });
                    },
                    onLoading: () {
                      context.read<UsersBloc>().add(
                        UsersEvent.get(
                          searchTerm: controller.text,
                          lastUser: users.last,
                        ),
                      );
                    },
                    onFailure: () {
                      context.read<UsersBloc>().add(
                        UsersEvent.get(lastUser: users.last),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomTextFormField(
          focusNode: focusNode,
          showCursor: true,
          readOnly: false,
          controller: controller,
          onTap: () {},
          onChanged: (value) {},
          hintText: 'Add a comment',
          prefixIcon: null,
          onNewImages: (images) {
            setState(() {
              _selectedImages = images;
              _insertedContent = null;
              _selectedFile = null;
            });
          },
          selectedImages: _selectedImages,
          onAddImages: (images) {
            setState(() {
              _selectedImages.addAll(images);
            });
          },
          onRemoveImage: (index) {
            setState(() {
              _selectedImages.removeAt(index);
            });
          },
          onNewFile: (file) {
            setState(() {
              _selectedFile = file;
              _selectedImages = [];
              _insertedContent = null;
            });
          },
          selectedFile: _selectedFile,
          onContentInsertion: (imageFile) {
            setState(() {
              _insertedContent = imageFile;
              _selectedImages = [];
              _selectedFile = null;
            });
          },
          insertedContent: _insertedContent,
          onRemoveInsertedContent: () {
            setState(() {
              _insertedContent = null;
            });
          },
          allowedMimeTypes: const <String>['image/png', 'image/gif'],
          onLocation: (point) {},
          location: null,
          onRemoveLocation: () {},
          onSectionSelection: (section) {},
          section: null,
          onRemoveSection: () {},
          onSend: selectedUsers.isEmpty
              ? null
              : () {
                  context.read<ChatDetailBloc>().add(
                    ChatDetailEvent.sendDirectMessage(
                      users: selectedUsers,
                      text: controller.text,
                      post: widget.post,
                      ballot: widget.ballot,
                      survey: widget.survey,
                      petition: widget.petition,
                      meeting: widget.meeting,
                      section: widget.section,
                      imagePath1: _insertedContent != null
                          ? _insertedContent!.path
                          : _selectedImages.isNotEmpty
                          ? _selectedImages[0].path
                          : null,
                      imagePath2: _selectedImages.length > 1
                          ? _selectedImages[1].path
                          : null,
                      imagePath3: _selectedImages.length > 2
                          ? _selectedImages[2].path
                          : null,
                      imagePath4: _selectedImages.length > 3
                          ? _selectedImages[3].path
                          : null,
                      filePath: _selectedFile?.path,
                      location: null, //TODO:
                    ),
                  );
                },
        ),
      ),
    );
  }
}
