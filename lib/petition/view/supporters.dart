import 'package:democracy/petition/bloc/supporters/supporters_bloc.dart';
import 'package:democracy/petition/models/petition.dart';
import 'package:democracy/user/view/utils/profile_navigator.dart';
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
  final RefreshController _refreshController = RefreshController();

  @override
  void initState() {
    context.read<SupportersBloc>().add(
      SupportersEvent.get(petition: widget.petition),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Supporters')),
      body: BlocBuilder<SupportersBloc, SupportersState>(
        builder: (context, state) {
          final users = state.users.toList();

          if (state.status == SupportersStatus.success) {
            if (_refreshController.headerStatus == RefreshStatus.refreshing) {
              _refreshController.refreshCompleted();
            }
            if (_refreshController.footerStatus == LoadStatus.loading) {
              _refreshController.loadComplete();
            }
          }

          if (state.status == SupportersStatus.failure) {
            if (_refreshController.headerStatus == RefreshStatus.refreshing) {
              _refreshController.refreshFailed();
            }
            if (_refreshController.footerStatus == LoadStatus.loading) {
              _refreshController.loadFailed();
            }
          }
          return UsersListView(
            users: users,
            loading: state.status == SupportersStatus.initial,
            failure: state.users.isNotEmpty
                ? false
                : state.status == SupportersStatus.failure,
            refreshController: _refreshController,
            enablePullDown: true,
            enablePullUp: state.hasNext,
            showProfileButtons: true,
            onUsersUpdated: (users) {
              context.read<SupportersBloc>().add(
                SupportersEvent.update(users: users),
              );
            },
            onUserTap: (user) {
              navigateToProfilePage(context: context, user: user);
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
                  lastUser: users.last,
                ),
              );
            },
            onFailure: () {
              context.read<SupportersBloc>().add(
                SupportersEvent.get(petition: widget.petition),
              );
            },
          );
        },
      ),
    );
  }
}
