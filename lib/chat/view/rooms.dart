import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/utils/view/bottom_loader.dart';
import 'package:democracy/app/utils/view/failure_retry_button.dart';
import 'package:democracy/app/utils/view/loading_indicator.dart';
import 'package:democracy/app/utils/view/profile_image.dart';
import 'package:democracy/auth/bloc/auth/auth_bloc.dart';
import 'package:democracy/auth/models/user.dart';
import 'package:democracy/chat/bloc/rooms/rooms_cubit.dart';
import 'package:democracy/chat/models/room.dart';
import 'package:democracy/chat/view/room_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Rooms extends StatefulWidget {
  const Rooms({super.key});

  @override
  State<Rooms> createState() => _RoomsState();
}

class _RoomsState extends State<Rooms> {
  final _scrollController = ScrollController();

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
                return ListView.builder(
                  controller: _scrollController,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    Room room = rooms[index];
                    User otherUser = room.users.firstWhere(
                      (u) => u.id != user.id,
                    );
                    String title =
                        '${otherUser.firstName} ${otherUser.lastName}';
                    return index >= rooms.length
                        ? (rooms.length > 2)
                            ? const BottomLoader()
                            : SizedBox.shrink()
                        : ListTile(
                          leading: ProfileImage(user: user),
                          title: Text(title),
                          subtitle: Text(
                            (room.lastMessage == null)
                                ? ''
                                : room.lastMessage!.text,
                            style: TextStyle(overflow: TextOverflow.ellipsis),
                          ),
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder:
                                    (context) => RoomDetail(
                                      title: title,
                                      room: room,
                                      otherUser: otherUser,
                                    ),
                              ),
                            );
                          },
                        );
                  },
                  itemCount: rooms.length,
                );
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
