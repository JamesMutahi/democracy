import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/utils/view/bottom_loader.dart';
import 'package:democracy/app/utils/view/failure_retry_button.dart';
import 'package:democracy/app/utils/view/profile_image.dart';
import 'package:democracy/chat/view/chat_detail.dart';
import 'package:democracy/user/models/user.dart';
import 'package:democracy/chat/bloc/chat_detail/chat_detail_cubit.dart';
import 'package:democracy/user/bloc/users/users_cubit.dart';
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
  final RefreshController _refreshController = RefreshController(
    initialRefresh: false,
  );

  @override
  void initState() {
    context.read<WebsocketBloc>().add(
      WebsocketEvent.getUsers(searchTerm: '', page: 1),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ChatDetailCubit, ChatDetailState>(
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
                    WebsocketEvent.getUsers(searchTerm: value, page: 1),
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
              child: BlocBuilder<UsersCubit, UsersState>(
                builder: (context, state) {
                  switch (state.status) {
                    case UsersStatus.success:
                      return SmartRefresher(
                        enablePullDown: false,
                        enablePullUp: state.hasNext ? true : false,
                        controller: _refreshController,
                        onLoading: () {
                          context.read<WebsocketBloc>().add(
                            WebsocketEvent.getUsers(
                              searchTerm: controller.text,
                              page: state.currentPage + 1,
                            ),
                          );
                        },
                        footer: ClassicFooter(),
                        child: ListView.builder(
                          padding: EdgeInsets.only(top: 5, bottom: 20),
                          itemBuilder: (BuildContext context, int index) {
                            User user = state.users[index];
                            return ListTile(
                              key: ValueKey(user.id),
                              onTap: () {
                                context.read<WebsocketBloc>().add(
                                  WebsocketEvent.createChat(user: user),
                                );
                              },
                              leading: ProfileImage(user: user),
                              title: Text(user.name),
                              subtitle: Text(user.username),
                            );
                          },
                          itemCount: state.users.length,
                        ),
                      );
                    case UsersStatus.failure:
                      return FailureRetryButton(
                        onPressed: () {
                          context.read<WebsocketBloc>().add(
                            WebsocketEvent.getUsers(searchTerm: '', page: 1),
                          );
                        },
                      );
                    default:
                      return BottomLoader();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
