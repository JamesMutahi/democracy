import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/utils/view/bottom_loader.dart';
import 'package:democracy/app/utils/view/bottom_text_form_field.dart';
import 'package:democracy/app/utils/view/failure_retry_button.dart';
import 'package:democracy/app/utils/view/profile_image.dart';
import 'package:democracy/app/utils/view/snack_bar_content.dart';
import 'package:democracy/auth/models/user.dart';
import 'package:democracy/chat/bloc/chat_detail/chat_detail_cubit.dart';
import 'package:democracy/chat/bloc/search_users/search_users_cubit.dart';
import 'package:democracy/poll/models/poll.dart';
import 'package:democracy/post/models/post.dart';
import 'package:democracy/survey/models/survey.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/symbols.dart';

class DirectMessage extends StatefulWidget {
  const DirectMessage({super.key, this.post, this.poll, this.survey});

  final Post? post;
  final Poll? poll;
  final Survey? survey;

  @override
  State<DirectMessage> createState() => _DirectMessageState();
}

class _DirectMessageState extends State<DirectMessage> {
  TextEditingController controller = TextEditingController();
  FocusNode focusNode = FocusNode();
  List<User> selectedUsers = [];

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  void initState() {
    context.read<WebsocketBloc>().add(
      WebsocketEvent.searchUsers(searchTerm: ''),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ChatDetailCubit, ChatDetailState>(
      listener: (context, state) {
        if (state is DirectMessageSent) {
          Navigator.pop(context);
          final snackBar = SnackBar(
            behavior: SnackBarBehavior.floating,
            backgroundColor: Theme.of(context).cardColor,
            content: SnackBarContent(
              message: 'Direct message sent',
              status: SnackBarStatus.success,
            ),
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
              child: TextFormField(
                onChanged: (value) {
                  context.read<WebsocketBloc>().add(
                    WebsocketEvent.searchUsers(searchTerm: value),
                  );
                },
                onTapOutside: (event) {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Theme.of(context).scaffoldBackgroundColor,
                  hintText: 'Search for people',
                  hintStyle: TextStyle(color: Theme.of(context).hintColor),
                  prefixIcon: Icon(Symbols.search_rounded),
                  prefixIconConstraints: const BoxConstraints(
                    minWidth: 0,
                    minHeight: 0,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            BlocBuilder<SearchUsersCubit, SearchUsersState>(
              builder: (context, state) {
                switch (state) {
                  case SearchUsersLoaded(:final users):
                    return ListView.builder(
                      padding: EdgeInsets.only(top: 5, bottom: 20),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        User user = users[index];
                        return ListTile(
                          key: ValueKey(user.id),
                          onTap: () {
                            setState(() {
                              if (selectedUsers.contains(user)) {
                                selectedUsers.remove(user);
                              } else {
                                selectedUsers.add(user);
                              }
                            });
                          },
                          selectedTileColor: Theme.of(context).highlightColor,
                          selected: selectedUsers.contains(user),
                          leading: ProfileImage(user: user),
                          title: Text(user.displayName),
                          subtitle: Text(user.name),
                          trailing:
                              selectedUsers.contains(user)
                                  ? Icon(Symbols.check_rounded)
                                  : SizedBox.shrink(),
                        );
                      },
                      itemCount: users.length,
                    );
                  case SearchUsersFailure():
                    return FailureRetryButton(
                      onPressed: () {
                        context.read<WebsocketBloc>().add(
                          WebsocketEvent.searchUsers(searchTerm: ''),
                        );
                      },
                    );
                  default:
                    return BottomLoader();
                }
              },
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
          onSend:
              selectedUsers.isEmpty
                  ? null
                  : () {
                    context.read<WebsocketBloc>().add(
                      WebsocketEvent.sendDirectMessage(
                        users: selectedUsers,
                        text: controller.text,
                        post: widget.post,
                        poll: widget.poll,
                        survey: widget.survey,
                      ),
                    );
                  },
        ),
      ),
    );
  }
}
