import 'package:democracy/broadcast/bloc/broadcast_detail/broadcast_detail_bloc.dart';
import 'package:democracy/broadcast/models/broadcast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BroadcastListener extends StatelessWidget {
  const BroadcastListener({
    super.key,
    required this.onCreate,
    required this.onUpdate,
    required this.onDelete,
    required this.child,
  });

  final void Function(Broadcast) onCreate;
  final void Function(Broadcast) onUpdate;
  final void Function(int) onDelete;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<BroadcastDetailBloc, BroadcastDetailState>(
      listener: (context, state) {
        switch (state) {
          case BroadcastCreated():
            onCreate(state.broadcast);
          case BroadcastLoaded():
            onUpdate(state.broadcast);
          case BroadcastUpdated():
            onUpdate(state.broadcast);
          case BroadcastDeleted():
            onDelete(state.broadcastId);
        }
      },
      child: child,
    );
  }
}
