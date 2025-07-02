import 'package:democracy/poll/bloc/poll_detail/poll_detail_cubit.dart';
import 'package:democracy/poll/models/poll.dart';
import 'package:democracy/poll/view/poll_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Polls extends StatefulWidget {
  const Polls({super.key, required this.polls});

  final List<Poll> polls;

  @override
  State<Polls> createState() => _PollsState();
}

class _PollsState extends State<Polls> {
  final _scrollController = ScrollController();
  late final List<Poll> _polls = widget.polls.toList();

  @override
  Widget build(BuildContext context) {
    return BlocListener<PollDetailCubit, PollDetailState>(
      listener: (context, state) {
        if (state is PollCreated) {
          if (!_polls.any((poll) => poll.id == state.poll.id)) {
            setState(() {
              _polls.add(state.poll);
            });
          }
        }
        if (state is PollUpdated) {
          if (_polls.any((poll) => poll.id == state.poll.id)) {
            setState(() {
              int index = _polls.indexWhere((poll) => poll.id == state.poll.id);
              _polls[index] = state.poll;
            });
          }
        }
      },
      child: ListView.builder(
        controller: _scrollController,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          Poll poll = _polls[index];
          return PollTile(key: ValueKey(poll.id), poll: poll);
        },
        itemCount: _polls.length,
      ),
    );
  }
}
