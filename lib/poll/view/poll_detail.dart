import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/utils/view/snack_bar_content.dart';
import 'package:democracy/poll/bloc/poll_detail/poll_detail_cubit.dart';
import 'package:democracy/poll/models/option.dart';
import 'package:democracy/poll/models/poll.dart';
import 'package:democracy/poll/view/poll_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PollDetail extends StatefulWidget {
  const PollDetail({super.key, required this.poll});

  final Poll poll;

  @override
  State<PollDetail> createState() => _PollDetailState();
}

class _PollDetailState extends State<PollDetail> {
  late Poll _poll = widget.poll;
  bool changingVote = false;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    _controller.text = _poll.reason == null ? '' : _poll.reason!.text;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool pollHasStarted =
        _poll.startTime.difference(DateTime.now()) < Duration(seconds: 0);
    bool pollHasEnded =
        _poll.endTime.difference(DateTime.now()) < Duration(seconds: 0);
    bool userHasVoted = _poll.votedOption != null;
    return BlocListener<PollDetailCubit, PollDetailState>(
      listener: (context, state) {
        if (state is PollUpdated) {
          if (_poll.id == state.poll.id) {
            if (_poll.reason?.text == state.poll.reason?.text) {
              setState(() {
                _poll = state.poll;
              });
            }
            _controller.text =
                state.poll.reason == null ? '' : state.poll.reason!.text;
          }
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(_poll.name, overflow: TextOverflow.ellipsis),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(_poll.description),
                SizedBox(height: 10),
                ..._poll.options.map((option) {
                  return AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child:
                        (pollHasEnded || userHasVoted && !changingVote)
                            ? PollPercentIndicator(
                              key: ValueKey(option.id),
                              poll: _poll,
                              option: option,
                            )
                            : OptionTile(
                              option: option,
                              onTap: () {
                                if (pollHasStarted) {
                                  context.read<WebsocketBloc>().add(
                                    WebsocketEvent.vote(option: option),
                                  );
                                  setState(() {
                                    changingVote = false;
                                  });
                                } else {
                                  final snackBar = SnackBar(
                                    behavior: SnackBarBehavior.floating,
                                    backgroundColor:
                                        Theme.of(context).cardColor,
                                    content: SnackBarContent(
                                      message: 'Not started',
                                      status: SnackBarStatus.info,
                                    ),
                                  );
                                  ScaffoldMessenger.of(
                                    context,
                                  ).clearSnackBars();
                                  ScaffoldMessenger.of(
                                    context,
                                  ).showSnackBar(snackBar);
                                }
                              },
                            ),
                  );
                }),
                userHasVoted && !pollHasEnded
                    ? changingVote
                        ? SizedBox.shrink()
                        : Align(
                          alignment: Alignment.topRight,
                          child: OutlinedButton(
                            onPressed: () {
                              setState(() {
                                changingVote = true;
                              });
                            },
                            child: Text('Change'),
                          ),
                        )
                    : SizedBox.shrink(),
                SizedBox(height: 20),
                !changingVote
                    ? ReasonWidget(
                      key: UniqueKey(),
                      controller: _controller,
                      poll: _poll,
                      pollHasEnded: pollHasEnded,
                    )
                    : SizedBox.shrink(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OptionTile extends StatelessWidget {
  const OptionTile({super.key, required this.option, required this.onTap});

  final Option option;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    double optionHeight = 40;
    return Container(
      key: UniqueKey(),
      margin: EdgeInsets.only(bottom: 8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          height: optionHeight,
          padding: EdgeInsets.all(9),
          decoration: BoxDecoration(
            color: Theme.of(context).canvasColor,
            border: Border.all(color: Colors.black, width: 1),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(child: Text(option.text)),
        ),
      ),
    );
  }
}

class ReasonWidget extends StatefulWidget {
  const ReasonWidget({
    super.key,
    required this.controller,
    required this.poll,
    required this.pollHasEnded,
  });

  final TextEditingController controller;
  final Poll poll;
  final bool pollHasEnded;

  @override
  State<ReasonWidget> createState() => _ReasonWidgetState();
}

class _ReasonWidgetState extends State<ReasonWidget> {
  bool submitButtonDisabled = true;
  bool submitButtonPressed = false;
  @override
  Widget build(BuildContext context) {
    return BlocListener<PollDetailCubit, PollDetailState>(
      listener: (context, state) {
        if (state is PollUpdated) {
          if (widget.poll.id == state.poll.id) {
            if (state.poll.reason != null) {
              if (submitButtonPressed) {
                final snackBar = SnackBar(
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: Theme.of(context).cardColor,
                  content: SnackBarContent(
                    message: 'Submitted',
                    status: SnackBarStatus.success,
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                setState(() {
                  submitButtonPressed = false;
                });
              }
            }
          }
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Share your reason",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(height: 5),
                Text(
                  "This is optional but will help to better understand "
                  "why you rejected or accepted the option. Your "
                  "contribution is greatly appreciated.",
                  style: TextStyle(color: Theme.of(context).hintColor),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            reverse: true,
            child: TextFormField(
              readOnly: widget.pollHasEnded,
              controller: widget.controller,
              onChanged: (value) {
                setState(() {
                  if (value == '') {
                    submitButtonDisabled = true;
                  } else {
                    submitButtonDisabled = false;
                  }
                });
              },
              minLines: 6,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              onTapOutside: (event) {
                FocusManager.instance.primaryFocus?.unfocus();
              },
            ),
          ),
          SizedBox(height: 10),
          widget.pollHasEnded
              ? SizedBox.shrink()
              : Align(
                alignment: Alignment.topRight,
                child: OutlinedButton(
                  onPressed:
                      widget.controller.text == ''
                          ? null
                          : () {
                            showDialog(
                              context: context,
                              builder:
                                  (context) => SubmissionDialog(
                                    onYesPressed: () {
                                      Navigator.pop(context);
                                      submitButtonPressed = true;
                                      context.read<WebsocketBloc>().add(
                                        WebsocketEvent.submitReason(
                                          poll: widget.poll,
                                          text: widget.controller.text,
                                        ),
                                      );
                                    },
                                  ),
                            );
                          },
                  child: Text('Submit'),
                ),
              ),
        ],
      ),
    );
  }
}

class SubmissionDialog extends StatelessWidget {
  const SubmissionDialog({super.key, required this.onYesPressed});

  final VoidCallback onYesPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Submit'),
      content: Text(
        'Are you sure you want to submit this?',
        textAlign: TextAlign.center,
      ),
      actions: <Widget>[
        OutlinedButton(onPressed: onYesPressed, child: const Text('Yes')),
        OutlinedButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('No'),
        ),
      ],
      actionsAlignment: MainAxisAlignment.center,
      buttonPadding: const EdgeInsets.all(20.0),
    );
  }
}
