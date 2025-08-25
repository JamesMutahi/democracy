import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/chat/bloc/chat_detail/chat_detail_cubit.dart';
import 'package:democracy/chat/view/chat_detail.dart';
import 'package:democracy/user/bloc/users/users_cubit.dart';
import 'package:democracy/user/models/user.dart';
import 'package:democracy/user/view/widgets/users_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class CreateMessage extends StatefulWidget {
  const CreateMessage({super.key});

  @override
  State<CreateMessage> createState() => _CreateMessageState();
}

class _CreateMessageState extends State<CreateMessage> {
  TextEditingController controller = TextEditingController();
  bool loading = true;
  bool failure = false;
  List<User> _users = [];
  bool hasNextPage = false;
  final RefreshController _refreshController = RefreshController(
    initialRefresh: false,
  );

  @override
  void initState() {
    context.read<WebsocketBloc>().add(
      WebsocketEvent.getUsers(lastUser: _users.last),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<ChatDetailCubit, ChatDetailState>(
          listener: (context, state) {
            if (state is ChatCreated) {
              Navigator.pop(context);
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder:
                      (context) => ChatDetail(
                        key: ValueKey(state.chat.id),
                        chat: state.chat,
                      ),
                ),
              );
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
                hasNextPage = state.hasNext;
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
          title: Text('Send Direct Message'),
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
                    WebsocketEvent.getUsers(
                      searchTerm: value,
                      lastUser: _users.last,
                    ),
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
            Expanded(
              child: UsersListView(
                users: _users,
                loading: loading,
                failure: failure,
                refreshController: _refreshController,
                enablePullUp: hasNextPage ? true : false,
                onUserTap: (user) {
                  context.read<WebsocketBloc>().add(
                    WebsocketEvent.createChat(user: user),
                  );
                },
                onLoading: () {
                  context.read<WebsocketBloc>().add(
                    WebsocketEvent.getUsers(
                      searchTerm: controller.text,
                      lastUser: _users.last,
                    ),
                  );
                },
                onFailure: () {
                  context.read<WebsocketBloc>().add(
                    WebsocketEvent.getUsers(lastUser: _users.last),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
