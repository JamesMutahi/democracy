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
            if (_poll.votedOption != state.poll.votedOption) {
              setState(() {
                _poll = state.poll;
              });
            }
          }
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(_poll.name, overflow: TextOverflow.ellipsis),
          actions: [
            Container(
              margin: EdgeInsets.only(right: 15),
              child: PollPopUp(poll: _poll),
            ),
          ],
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
                TimeLeft(
                  key: UniqueKey(),
                  startTime: _poll.startTime,
                  endTime: _poll.endTime,
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.only(
                    top: 10,
                    left: 10,
                    right: 10,
                    bottom: 5,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).splashColor,
                    borderRadius: BorderRadius.all(const Radius.circular(8)),
                  ),
                  child: Column(
                    children: [
                      ..._poll.options.map((option) {
                        return AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          child:
                              (pollHasEnded || userHasVoted && !changingVote)
                                  ? PollPercentIndicator(
                                    key: ValueKey(option.id),
                                    poll: _poll,
                                    option: option,
                                    animateToInitialPercent: true,
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
                                        final snackBar = getSnackBar(
                                          context: context,
                                          message: 'Not started',
                                          status: SnackBarStatus.info,
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
                    ],
                  ),
                ),
                SizedBox(height: 10),
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
                      poll: _poll,
                      pollHasEnded: pollHasEnded,
                      pollHasStarted: pollHasStarted,
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
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    double optionHeight = 40;
    return Container(
      key: UniqueKey(),
      margin: EdgeInsets.symmetric(vertical: 10),
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
    required this.poll,
    required this.pollHasEnded,
    required this.pollHasStarted,
  });

  final Poll poll;
  final bool pollHasEnded;
  final bool pollHasStarted;

  @override
  State<ReasonWidget> createState() => _ReasonWidgetState();
}

class _ReasonWidgetState extends State<ReasonWidget> {
  late Poll _poll = widget.poll;
  late String reason = '';

  @override
  Widget build(BuildContext context) {
    return BlocListener<PollDetailCubit, PollDetailState>(
      listener: (context, state) {
        if (state is PollUpdated) {
          if (state.poll.reason?.text != _poll.reason?.text) {
            setState(() {
              _poll = state.poll;
            });
            final snackBar = getSnackBar(
              context: context,
              message: 'Submitted',
              status: SnackBarStatus.success,
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(),
          const SizedBox(height: 10),
          const Text(
            'Your reason for the decision is greatly appreciated '
            'and will help in better understanding what people want.',
          ),
          const SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            reverse: true,
            child: TextFormField(
              initialValue: _poll.reason?.text,
              onChanged: (value) {
                setState(() {
                  reason = value;
                });
              },
              readOnly:
                  widget.pollHasEnded
                      ? true
                      : widget.pollHasStarted
                      ? false
                      : true,
              minLines: 1,
              maxLines: 10,
              maxLength: widget.pollHasEnded ? null : 300,
              keyboardType: TextInputType.multiline,
              onTapOutside: (event) {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: Theme.of(context).scaffoldBackgroundColor,
                hintText: widget.pollHasEnded ? '' : 'Enter reason',
                hintStyle: TextStyle(color: Theme.of(context).hintColor),
                prefixIconConstraints: const BoxConstraints(
                  minWidth: 0,
                  minHeight: 0,
                ),
                border: InputBorder.none,
                focusedBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(0),
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(0),
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.outline,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Visibility(
            visible: !widget.pollHasEnded,
            child: Align(
              alignment: Alignment.topRight,
              child: OutlinedButton(
                onPressed:
                    reason == ''
                        ? null
                        : reason == _poll.reason?.text
                        ? null
                        : () {
                          showDialog(
                            context: context,
                            builder:
                                (context) => SubmissionDialog(
                                  onYesPressed: () {
                                    Navigator.pop(context);
                                    context.read<WebsocketBloc>().add(
                                      WebsocketEvent.submitReason(
                                        poll: _poll,
                                        text: reason,
                                      ),
                                    );
                                  },
                                ),
                          );
                        },
                child: Text('Submit'),
              ),
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
      title: Center(child: Text('Submit')),
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
