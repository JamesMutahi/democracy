import 'package:democracy/app/bloc/services/websocket_service.dart';
import 'package:democracy/user/bloc/follow_recommendations/follow_recommendations_bloc.dart';
import 'package:democracy/user/view/pages/follow_recommendations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void navigateToFollowRecommendations({required BuildContext context}) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => BlocProvider(
        create: (context) => FollowRecommendationsBloc(
          webSocketService: context.read<WebSocketService>(),
        ),
        child: FollowRecommendations(),
      ),
    ),
  );
}
