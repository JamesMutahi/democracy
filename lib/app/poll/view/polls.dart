import 'package:democracy/app/poll/bloc/poll/poll_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Polls extends StatefulWidget {
  const Polls({super.key});

  @override
  State<Polls> createState() => _PollsState();
}

class _PollsState extends State<Polls> {
  @override
  void initState() {
    super.initState();
    context.read<PollBloc>().add(PollEvent.initialize());
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
