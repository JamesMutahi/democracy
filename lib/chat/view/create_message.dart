import 'package:democracy/chat/bloc/chat_detail/chat_detail_bloc.dart';
import 'package:democracy/chat/view/utils/chat_navigator.dart';
import 'package:democracy/user/bloc/users/users_bloc.dart';
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
  final RefreshController _refreshController = RefreshController();

  @override
  void initState() {
    context.read<UsersBloc>().add(UsersEvent.get());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ChatDetailBloc, ChatDetailState>(
      listener: (context, state) {
        if (state is ChatCreated) {
          Navigator.pop(context);
          navigateToChatDetail(context: context, chat: state.chat);
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
                controller: controller,
                onChanged: (value) {
                  context.read<UsersBloc>().add(
                    UsersEvent.get(searchTerm: value),
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
                    loading:
                        state.status == UsersStatus.initial ||
                        state.status == UsersStatus.loading,
                    failure: state.status == UsersStatus.failure,
                    refreshController: _refreshController,
                    enablePullUp: state.hasNext,
                    onUserTap: (user) {
                      context.read<ChatDetailBloc>().add(
                        ChatDetailEvent.create(user: user),
                      );
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
      ),
    );
  }
}
