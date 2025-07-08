import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/utils/view/failure_retry_button.dart';
import 'package:democracy/app/utils/view/loading_indicator.dart';
import 'package:democracy/app/utils/view/no_results.dart';
import 'package:democracy/poll/bloc/polls/polls_cubit.dart';
import 'package:democracy/poll/view/polls.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PollPage extends StatefulWidget {
  const PollPage({super.key});

  @override
  State<PollPage> createState() => _PollPageState();
}

class _PollPageState extends State<PollPage> {
  @override
  void initState() {
    context.read<WebsocketBloc>().add(WebsocketEvent.getPolls());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PollsCubit, PollsState>(
      builder: (context, state) {
        switch (state) {
          case PollsLoaded(:final polls):
            return (polls.isNotEmpty)
                ? Polls(key: UniqueKey(), polls: polls)
                : const NoResults();
          case PollsFailure():
            return FailureRetryButton(
              onPressed: () {
                context.read<WebsocketBloc>().add(
                  const WebsocketEvent.getPolls(),
                );
              },
            );
          default:
            return const LoadingIndicator();
        }
      },
    );
  }
}
