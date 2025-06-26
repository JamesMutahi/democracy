import 'package:democracy/app/utils/view/profile_image.dart';
import 'package:democracy/auth/models/user.dart';
import 'package:democracy/chat/bloc/room_detail/room_detail_cubit.dart';
import 'package:democracy/chat/models/room.dart';
import 'package:democracy/chat/view/room_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Rooms extends StatefulWidget {
  const Rooms({super.key, required this.rooms, required this.currentUser});

  final List<Room> rooms;
  final User currentUser;

  @override
  State<Rooms> createState() => _RoomsState();
}

class _RoomsState extends State<Rooms> {
  late final List<Room> _rooms = widget.rooms.toList();

  @override
  Widget build(BuildContext context) {
    return BlocListener<RoomDetailCubit, RoomDetailState>(
      listener: (context, state) {
        if (state is RoomCreated) {
          setState(() {
            _rooms.add(state.room);
          });
        }
        if (state is MessageCreated) {
          if (_rooms.any((element) => element.id == state.room.id)) {
            setState(() {
              _rooms[_rooms.indexWhere((room) => room.id == state.room.id)] =
                  state.room;
            });
          }
        }
      },
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          Room room = _rooms[index];
          return RoomTile(
            key: ValueKey(room.id),
            currentUser: widget.currentUser,
            room: _rooms[index],
          );
        },
        itemCount: _rooms.length,
      ),
    );
  }
}

class RoomTile extends StatelessWidget {
  const RoomTile({super.key, required this.currentUser, required this.room});

  final User currentUser;
  final Room room;

  @override
  Widget build(BuildContext context) {
    User otherUser = room.users.firstWhere((u) => u.id != currentUser.id);
    String title = '${otherUser.firstName} ${otherUser.lastName}';
    return ListTile(
      leading: ProfileImage(user: currentUser),
      title: Text(title),
      subtitle: Text(
        room.lastMessage.text,
        style: TextStyle(overflow: TextOverflow.ellipsis),
      ),
      trailing:
          room.lastMessage.isRead
              ? SizedBox.shrink()
              : Icon(Icons.circle_rounded, size: 5, color: Colors.greenAccent),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder:
                (context) => RoomDetail(
                  key: ValueKey(room.id),
                  title: title,
                  room: room,
                  otherUser: otherUser,
                ),
          ),
        );
      },
    );
  }
}
