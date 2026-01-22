import 'package:democracy/app/utils/dialogs.dart';
import 'package:democracy/app/utils/snack_bar_content.dart';
import 'package:democracy/ballot/bloc/ballot_detail/ballot_detail_bloc.dart';
import 'package:democracy/ballot/models/ballot.dart';
import 'package:democracy/ballot/models/option.dart';
import 'package:democracy/ballot/view/ballot_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BallotDetail extends StatefulWidget {
  const BallotDetail({super.key, required this.ballot});

  final Ballot ballot;

  @override
  State<BallotDetail> createState() => _BallotDetailState();
}

class _BallotDetailState extends State<BallotDetail> {
  late Ballot _ballot = widget.ballot;
  bool changingVote = false;

  @override
  Widget build(BuildContext context) {
    bool userHasVoted = _ballot.votedOption != null;
    return BlocListener<BallotDetailBloc, BallotDetailState>(
      listener: (context, state) {
        if (state is BallotUpdated) {
          if (_ballot.id == state.ballot.id) {
            setState(() {
              _ballot = state.ballot;
            });
          }
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Ballot'),
          actions: [
            Container(
              margin: EdgeInsets.only(right: 15),
              child: BallotPopUp(ballot: _ballot),
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
                Text(
                  _ballot.title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(height: 5),
                Text(_ballot.description),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TimeLeft(
                      startTime: _ballot.startTime,
                      endTime: _ballot.endTime,
                    ),
                    Text(
                      '${_ballot.totalVotes} ${_ballot.totalVotes == 1 ? 'vote' : 'votes'}',
                      style: TextStyle(color: Theme.of(context).disabledColor),
                    ),
                  ],
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
                    color: Theme.of(context).colorScheme.tertiaryContainer,
                    borderRadius: BorderRadius.all(const Radius.circular(8)),
                  ),
                  child: Column(
                    children: [
                      ..._ballot.options.map((option) {
                        return AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          child:
                              (!_ballot.isActive ||
                                  (userHasVoted && !changingVote))
                              ? BallotPercentIndicator(
                                  key: ValueKey(option.id),
                                  ballot: _ballot,
                                  option: option,
                                  animateToInitialPercent: true,
                                )
                              : OptionTile(
                                  option: option,
                                  onTap: () {
                                    if (_ballot.isActive) {
                                      context.read<BallotDetailBloc>().add(
                                        BallotDetailEvent.vote(option: option),
                                      );
                                      setState(() {
                                        changingVote = false;
                                      });
                                    } else {
                                      final snackBar = getSnackBar(
                                        context: context,
                                        message: 'Closed',
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
                userHasVoted && _ballot.isActive
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
                    ? ReasonWidget(ballot: _ballot)
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
      margin: EdgeInsets.symmetric(vertical: 5),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          height: optionHeight,
          padding: EdgeInsets.all(9),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondaryContainer,
          ),
          child: Center(child: Text(option.text)),
        ),
      ),
    );
  }
}

class ReasonWidget extends StatefulWidget {
  const ReasonWidget({super.key, required this.ballot});

  final Ballot ballot;

  @override
  State<ReasonWidget> createState() => _ReasonWidgetState();
}

class _ReasonWidgetState extends State<ReasonWidget> {
  late Ballot _ballot = widget.ballot;
  late String reason = '';

  @override
  Widget build(BuildContext context) {
    return BlocListener<BallotDetailBloc, BallotDetailState>(
      listener: (context, state) {
        if (state is BallotUpdated) {
          if (state.ballot.reason?.text != _ballot.reason?.text) {
            setState(() {
              _ballot = state.ballot;
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
              initialValue: _ballot.reason?.text,
              onChanged: (value) {
                setState(() {
                  reason = value;
                });
              },
              readOnly: !widget.ballot.isActive,
              minLines: 1,
              maxLines: 10,
              maxLength: widget.ballot.isActive ? 300 : null,
              keyboardType: TextInputType.multiline,
              onTapOutside: (event) {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: Theme.of(context).scaffoldBackgroundColor,
                hintText: widget.ballot.isActive ? 'Enter reason' : '',
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
            visible: widget.ballot.isActive,
            child: Align(
              alignment: Alignment.topRight,
              child: OutlinedButton(
                onPressed: reason == ''
                    ? null
                    : reason == _ballot.reason?.text
                    ? null
                    : () {
                        showDialog(
                          context: context,
                          builder: (context) => SubmissionDialog(
                            onYesPressed: () {
                              context.read<BallotDetailBloc>().add(
                                BallotDetailEvent.submitReason(
                                  ballot: _ballot,
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
    return CustomDialog(
      title: 'Submit',
      content: 'Are you sure you want to submit this?',
      button1Text: 'Yes',
      onButton1Pressed: () {
        Navigator.pop(context);
        onYesPressed();
      },
      button2Text: 'No',
      onButton2Pressed: () {
        Navigator.pop(context);
      },
    );
  }
}
