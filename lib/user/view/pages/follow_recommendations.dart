import 'package:democracy/app/shared/widgets/bottom_loader.dart';
import 'package:democracy/auth/bloc/auth/auth_bloc.dart';
import 'package:democracy/user/bloc/follow_recommendations/follow_recommendations_bloc.dart';
import 'package:democracy/user/bloc/user_detail/user_detail_bloc.dart';
import 'package:democracy/user/models/user.dart';
import 'package:democracy/user/view/utils/profile_navigator.dart';
import 'package:democracy/user/view/widgets/user_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FollowRecommendations extends StatefulWidget {
  const FollowRecommendations({super.key});

  @override
  State<FollowRecommendations> createState() => _FollowRecommendationsState();
}

class _FollowRecommendationsState extends State<FollowRecommendations> {
  @override
  void initState() {
    super.initState();
    context.read<FollowRecommendationsBloc>().add(
      FollowRecommendationsEvent.get(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Who to follow')),
      body: BlocBuilder<FollowRecommendationsBloc, FollowRecommendationsState>(
        builder: (context, state) {
          final users = state.users.take(3).toList();

          final authBloc = context.read<AuthBloc>();
          final me = (authBloc.state as Authenticated).user;

          if (state.status == FollowRecommendationsStatus.loading) {
            return BottomLoader();
          }

          return BlocListener<UserDetailBloc, UserDetailState>(
            listener: (context, state) {
              if (state is UserUpdated) {
                if (users.any((user) => user.id == state.user.id)) {
                  int index = users.indexWhere(
                    (user) => user.id == state.user.id,
                  );
                  users[index] = state.user;
                  context.read<FollowRecommendationsBloc>().add(
                    FollowRecommendationsEvent.update(users: users),
                  );
                }
              }
            },
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                User user = users[index];
                return UserTile(
                  user: user,
                  me: me,
                  showProfileButtons: true,
                  selectedUsers: [],
                  onTap: () {
                    navigateToProfilePage(context: context, user: user);
                  },
                );
              },
              itemCount: users.length,
            ),
          );
        },
      ),
    );
  }
}
