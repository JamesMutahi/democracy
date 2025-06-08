import 'package:democracy/app/poll/bloc/poll/poll_bloc.dart';
import 'package:democracy/app/poll/models/poll.dart';
import 'package:democracy/app/utils/view/bottom_loader.dart';
import 'package:democracy/app/utils/view/failure_retry_button.dart';
import 'package:democracy/app/utils/view/loading_indicator.dart';
import 'package:democracy/app/utils/view/no_results.dart' show NoResults;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/flutter_percent_indicator.dart';

class Polls extends StatefulWidget {
  const Polls({super.key});

  @override
  State<Polls> createState() => _PollsState();
}

class _PollsState extends State<Polls> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    context.read<PollBloc>().add(PollEvent.initialize());
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<PollBloc, PollState>(
        builder: (context, state) {
          switch (state.status) {
            case PollStatus.success:
              List<Poll> polls = state.polls;
              return (polls.isNotEmpty)
                  ? ListView.builder(
                    controller: _scrollController,
                    scrollDirection: Axis.vertical,
                    padding: const EdgeInsets.only(
                      left: 20.0,
                      right: 20.0,
                      bottom: 160,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return index >= polls.length
                          ? const BottomLoader()
                          : PollTile(key: ValueKey(index), poll: polls[index]);
                    },
                    itemCount:
                        state.next == null ? polls.length : polls.length + 1,
                  )
                  : const NoResults();
            case PollStatus.failure:
              return FailureRetryButton(
                onPressed: () {
                  context.read<PollBloc>().add(const PollEvent.reload());
                },
              );
            default:
              return const LoadingIndicator();
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) context.read<PollBloc>().add(GetPolls());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    if (_scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      return false;
    }
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}

class PollTile extends StatelessWidget {
  const PollTile({super.key, required this.poll});

  final Poll poll;

  @override
  Widget build(BuildContext context) {
    bool pollHasEnded =
        poll.endTime.difference(DateTime.now()) < Duration(seconds: 0);
    bool userHasVoted = poll.votedOption != null;
    double optionHeight = 40;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(poll.name),
        Text(poll.description),
        ...poll.options.map((option) {
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child:
                (pollHasEnded || userHasVoted)
                    ? Container(
                      key: UniqueKey(),
                      margin: EdgeInsets.only(bottom: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          const Radius.circular(8),
                        ),
                      ),
                      child: LinearPercentIndicator(
                        lineHeight: optionHeight,
                        barRadius: const Radius.circular(8),
                        padding: EdgeInsets.zero,
                        percent:
                            poll.totalVotes == 0
                                ? 0
                                : option.votes / poll.totalVotes,
                        animation: true,
                        animationDuration: 300,
                        // backgroundColor: votedBackgroundColor,
                        // progressColor:
                        // votedOption == option.id
                        //     ? leadingVotedProgessColor
                        //     : votedProgressColor,
                        center: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(horizontal: 14),
                          child: Row(
                            children: [
                              Text(option.text),
                              SizedBox(width: 20),
                              if (poll.votedOption == option.id)
                                const Icon(
                                  Icons.check_circle_outline_rounded,
                                  color: Colors.black,
                                  size: 16,
                                ),
                              const Spacer(),
                              Text(
                                poll.totalVotes == 0
                                    ? "0 votes"
                                    : '${(option.votes / poll.totalVotes * 100).toStringAsFixed(1)}%',
                                // style: votedPercentageTextStyle,
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                    : Container(
                      key: UniqueKey(),
                      margin: EdgeInsets.only(bottom: 8),
                      child: InkWell(
                        onTap: () {},
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          height: optionHeight,
                          // width: pollOptionsWidth,
                          padding: EdgeInsets.all(9),
                          decoration: BoxDecoration(
                            // color: Theme.of(context).primaryColor,
                            border: Border.all(color: Colors.black, width: 1),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(child: Text(option.text)),
                        ),
                      ),
                    ),
          );
        }),
      ],
    );
  }
}
