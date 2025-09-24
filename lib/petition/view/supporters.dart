import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/petition/bloc/supporters/supporters_bloc.dart';
import 'package:democracy/petition/models/petition.dart';
import 'package:democracy/user/bloc/users/users_bloc.dart';
import 'package:democracy/user/models/user.dart';
import 'package:democracy/user/view/profile.dart';
import 'package:democracy/user/view/widgets/users_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class Supporters extends StatefulWidget {
  const Supporters({super.key, required this.petition});

  final Petition petition;

  @override
  State<Supporters> createState() => _SupportersState();
}

class _SupportersState extends State<Supporters> {
  bool loading = true;
  bool failure = false;
  List<User> _users = [];
  bool hasNextPage = false;
  final RefreshController _refreshController = RefreshController(
    initialRefresh: false,
  );

  @override
  void initState() {
    context.read<SupportersBloc>().add(
      SupportersEvent.get(petition: widget.petition),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (_, __) {
        context.read<UsersBloc>().add(UsersEvent.unsubscribe(users: _users));
      },
      child: Scaffold(
        appBar: AppBar(title: Text('Supporters')),
        body: MultiBlocListener(
          listeners: [
            BlocListener<WebsocketBloc, WebsocketState>(
              listener: (context, state) {
                if (state.status == WebsocketStatus.connected) {
                  context.read<UsersBloc>().add(
                    UsersEvent.resubscribe(users: _users),
                  );
                }
              },
            ),
            BlocListener<SupportersBloc, SupportersState>(
              listener: (context, state) {
                if (state.status == SupportersStatus.success) {
                  setState(() {
                    _users = state.users;
                    loading = false;
                    failure = false;
                    hasNextPage = state.hasNext;
                  });
                  if (_refreshController.headerStatus ==
                      RefreshStatus.refreshing) {
                    _refreshController.refreshCompleted();
                  }
                  if (_refreshController.footerStatus == LoadStatus.loading) {
                    _refreshController.loadComplete();
                  }
                }
                if (state.status == SupportersStatus.failure) {
                  if (loading) {
                    setState(() {
                      loading = false;
                      failure = true;
                    });
                  }
                  if (_refreshController.headerStatus ==
                      RefreshStatus.refreshing) {
                    _refreshController.refreshFailed();
                  }
                  if (_refreshController.footerStatus == LoadStatus.loading) {
                    _refreshController.loadFailed();
                  }
                }
              },
            ),
          ],
          child: PopScope(
            canPop: true,
            onPopInvokedWithResult: (_, __) {
              context.read<UsersBloc>().add(
                UsersEvent.unsubscribe(users: _users),
              );
            },
            child: UsersListView(
              users: _users,
              loading: loading,
              failure: failure,
              refreshController: _refreshController,
              enablePullDown: true,
              enablePullUp: hasNextPage,
              showProfileButtons: true,
              onUsersUpdated: (users) {
                setState(() {
                  _users = users;
                });
              },
              onUserTap: (user) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfilePage(user: user),
                  ),
                );
              },
              onRefresh: () {
                context.read<SupportersBloc>().add(
                  SupportersEvent.get(petition: widget.petition),
                );
              },
              onLoading: () {
                context.read<SupportersBloc>().add(
                  SupportersEvent.get(
                    petition: widget.petition,
                    lastUser: _users.last,
                  ),
                );
              },
              onFailure: () {
                context.read<SupportersBloc>().add(
                  SupportersEvent.get(petition: widget.petition),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
