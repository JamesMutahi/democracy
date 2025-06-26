import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/utils/view/failure_retry_button.dart';
import 'package:democracy/app/utils/view/loading_indicator.dart';
import 'package:democracy/auth/bloc/auth/auth_bloc.dart';
import 'package:democracy/auth/models/user.dart';
import 'package:democracy/chat/bloc/rooms/rooms_cubit.dart';
import 'package:democracy/chat/view/rooms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({super.key});

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  @override
  void initState() {
    context.read<WebsocketBloc>().add(WebsocketEvent.loadRooms());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RoomsCubit, RoomsState>(
      builder: (context, state) {
        switch (state) {
          case RoomsLoaded(:final rooms):
            return BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                late User user;
                if (state is Authenticated) {
                  user = state.user;
                }
                return Rooms(rooms: rooms, currentUser: user);
              },
            );
          case RoomsFailure():
            return FailureRetryButton(
              onPressed: () {
                context.read<RoomsCubit>().retryButtonPressed();
                context.read<WebsocketBloc>().add(WebsocketEvent.loadRooms());
              },
            );
          default:
            return LoadingIndicator();
        }
      },
    );
  }
}
