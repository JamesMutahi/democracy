import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/utils/view/bottom_text_form_field.dart';
import 'package:democracy/app/utils/view/snack_bar_content.dart';
import 'package:democracy/user/models/user.dart';
import 'package:democracy/chat/bloc/chat_detail/chat_detail_cubit.dart';
import 'package:democracy/poll/models/poll.dart';
import 'package:democracy/post/models/post.dart';
import 'package:democracy/survey/models/survey.dart';
import 'package:democracy/user/bloc/users/users_cubit.dart';
import 'package:democracy/user/view/widgets/users_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

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
  bool loading = true;
  bool failure = false;
  List<User> _users = [];
  List<User> selectedUsers = [];
  int currentPage = 1;
  bool hasNextPage = false;
  final RefreshController _refreshController = RefreshController(
    initialRefresh: false,
  );

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  void initState() {
    context.read<WebsocketBloc>().add(WebsocketEvent.getUsers());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<ChatDetailCubit, ChatDetailState>(
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
        ),
        BlocListener<UsersCubit, UsersState>(
          listener: (context, state) {
            if (state.status == UsersStatus.success) {
              setState(() {
                _users = state.users;
                loading = false;
                failure = false;
                currentPage = currentPage;
                hasNextPage = hasNextPage;
              });
              if (_refreshController.headerStatus == RefreshStatus.refreshing) {
                _refreshController.refreshCompleted();
              }
              if (_refreshController.footerStatus == LoadStatus.loading) {
                _refreshController.loadComplete();
              }
            }
            if (state.status == UsersStatus.failure) {
              if (loading) {
                setState(() {
                  loading = false;
                  failure = true;
                });
              }
              if (_refreshController.headerStatus == RefreshStatus.refreshing) {
                _refreshController.refreshFailed();
              }
              if (_refreshController.footerStatus == LoadStatus.loading) {
                _refreshController.loadFailed();
              }
            }
          },
        ),
      ],
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
                      width:
                          selectedUsers.length < 2
                              ? MediaQuery.of(context).size.width
                              : 200,
                      child: TextFormField(
                        onChanged: (value) {
                          context.read<WebsocketBloc>().add(
                            WebsocketEvent.getUsers(searchTerm: value),
                          );
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Theme.of(context).scaffoldBackgroundColor,
                          hintText:
                              selectedUsers.isEmpty
                                  ? 'Search for people'
                                  : null,
                          hintStyle: TextStyle(
                            color: Theme.of(context).hintColor,
                          ),
                          prefixIcon:
                              selectedUsers.isEmpty
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
              child: UsersListView(
                users: _users,
                loading: loading,
                failure: failure,
                refreshController: _refreshController,
                enablePullUp: hasNextPage ? true : false,
                selectedUsers: selectedUsers,
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
                  context.read<WebsocketBloc>().add(
                    WebsocketEvent.getUsers(
                      searchTerm: controller.text,
                      page: currentPage + 1,
                    ),
                  );
                },
                onFailure: () {
                  context.read<WebsocketBloc>().add(
                    WebsocketEvent.getUsers(page: currentPage),
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
