import 'package:auto_route/auto_route.dart';
import 'package:democracy/app/bloc/services/websocket_service.dart';
import 'package:democracy/app/view/router/router.gr.dart';
import 'package:democracy/petition/bloc/supporters/supporters_bloc.dart';
import 'package:democracy/user/view/widgets/users_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

@RoutePage()
class Supporters extends StatefulWidget {
  const Supporters({super.key, @PathParam('id') required this.petitionId});

  final int petitionId;

  @override
  State<Supporters> createState() => _SupportersState();
}

class _SupportersState extends State<Supporters> {
  final RefreshController _refreshController = RefreshController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SupportersBloc(webSocketService: context.read<WebSocketService>())
            ..add(SupportersEvent.get(petitionId: widget.petitionId)),
      child: Scaffold(
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
                context.router.push(ProfileRoute(userId: user.id));
              },
              onRefresh: () {
                context.read<SupportersBloc>().add(
                  SupportersEvent.get(petitionId: widget.petitionId),
                );
              },
              onLoading: () {
                context.read<SupportersBloc>().add(
                  SupportersEvent.get(
                    petitionId: widget.petitionId,
                    lastUser: users.last,
                  ),
                );
              },
              onFailure: () {
                context.read<SupportersBloc>().add(
                  SupportersEvent.get(petitionId: widget.petitionId),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
