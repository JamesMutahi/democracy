import 'package:auto_route/auto_route.dart';
import 'package:democracy/app/bloc/services/websocket_service.dart';
import 'package:democracy/app/shared/widgets/active_scroll_controller.dart';
import 'package:democracy/app/shared/widgets/main_container.dart';
import 'package:democracy/app/view/router/router.gr.dart';
import 'package:democracy/petition/bloc/supporters/supporters_bloc.dart';
import 'package:democracy/user/view/widgets/users_listview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:responsive_framework/responsive_framework.dart';

@RoutePage()
class Supporters extends StatefulWidget {
  const Supporters({super.key, @PathParam('id') required this.petitionId});

  final int petitionId;

  @override
  State<Supporters> createState() => _SupportersState();
}

class _SupportersState extends State<Supporters> {
  final RefreshController _refreshController = RefreshController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // Register the initial active controller
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ActiveScrollController.activate(_scrollController);
    });
  }

  @override
  void dispose() {
    // Clear the registry when leaving
    ActiveScrollController.deactivate(_scrollController);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveBreakpoints.of(context);
    final isWebLayout = kIsWeb && responsive.largerThan(MOBILE);

    return BlocProvider(
      create: (context) =>
          SupportersBloc(webSocketService: context.read<WebSocketService>())
            ..add(SupportersEvent.get(petitionId: widget.petitionId)),
      child: MainContainer(
        child: Scaffold(
          appBar: AppBar(title: Text('Supporters')),
          body: BlocBuilder<SupportersBloc, SupportersState>(
            builder: (context, state) {
              final users = state.users.toList();

              if (state.status == SupportersStatus.success) {
                if (_refreshController.headerStatus ==
                    RefreshStatus.refreshing) {
                  _refreshController.refreshCompleted();
                }
                if (_refreshController.footerStatus == LoadStatus.loading) {
                  _refreshController.loadComplete();
                }
              }

              if (state.status == SupportersStatus.failure) {
                if (_refreshController.headerStatus ==
                    RefreshStatus.refreshing) {
                  _refreshController.refreshFailed();
                }
                if (_refreshController.footerStatus == LoadStatus.loading) {
                  _refreshController.loadFailed();
                }
              }
              return UsersListView(
                scrollController: isWebLayout ? _scrollController : null,
                physics: isWebLayout ? NeverScrollableScrollPhysics() : null,
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
                  context.router.push(ProfileRoute(username: user.username));
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
      ),
    );
  }
}
