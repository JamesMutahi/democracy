import 'package:auto_route/auto_route.dart';
import 'package:democracy/app/bloc/services/websocket_service.dart'
    show WebsocketStatus, WebSocketService;
import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/shared/widgets/bottom_loader.dart';
import 'package:democracy/app/shared/widgets/dialogs.dart';
import 'package:democracy/app/shared/widgets/failure_retry_button.dart';
import 'package:democracy/app/shared/widgets/snack_bar_content.dart';
import 'package:democracy/ballot/bloc/ballot/ballot_bloc.dart';
import 'package:democracy/ballot/bloc/ballot_detail/ballot_detail_bloc.dart';
import 'package:democracy/ballot/models/ballot.dart';
import 'package:democracy/ballot/models/option.dart';
import 'package:democracy/ballot/view/widgets/ballot_tile.dart';
import 'package:democracy/geo/view/widgets/geo_chip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class BallotDetail extends StatelessWidget {
  const BallotDetail({super.key, @PathParam('id') required this.ballotId});

  final int ballotId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          BallotBloc(webSocketService: context.read<WebSocketService>())
            ..add(BallotEvent.load(ballotId: ballotId)),
      child: BlocBuilder<BallotBloc, BallotState>(
        buildWhen: (previous, current) => current.ballotId == ballotId,
        builder: (context, state) {
          if (state.status == BallotStatus.initial ||
              (state.status == BallotStatus.loading && state.ballot == null)) {
            return BottomLoader();
          }
          if (state.status == BallotStatus.failure && state.ballot == null) {
            return FailureRetryButton(
              onPressed: () {
                context.read<BallotBloc>().add(
                  BallotEvent.load(ballotId: ballotId),
                );
              },
            );
          }
          return _BallotDetail(ballot: state.ballot!);
        },
      ),
    );
  }
}

class _BallotDetail extends StatefulWidget {
  const _BallotDetail({required this.ballot});

  final Ballot ballot;

  @override
  State<_BallotDetail> createState() => _BallotDetailState();
}

class _BallotDetailState extends State<_BallotDetail> {
  bool changingVote = false;
  late final TextEditingController _textEditingController =
      TextEditingController(
        text: widget.ballot.reason == null ? '' : widget.ballot.reason!.text,
      );

  @override
  Widget build(BuildContext context) {
    bool userHasVoted = widget.ballot.votedOption != null;
    return MultiBlocListener(
      listeners: [
        BlocListener<WebsocketBloc, WebsocketState>(
          listener: (context, state) {
            if (state.status == WebsocketStatus.connected) {
              context.read<BallotDetailBloc>().add(
                BallotDetailEvent.retrieve(ballot: widget.ballot),
              );
            }
          },
        ),
        BlocListener<BallotDetailBloc, BallotDetailState>(
          listener: (context, state) {
            if (state is BallotUpdated) {
              if (widget.ballot.id == state.ballot.id) {
                if (state.ballot.reason?.text != widget.ballot.reason?.text) {
                  final snackBar = getSnackBar(
                    context: context,
                    message: 'Submitted',
                    status: SnackBarStatus.success,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
                context.read<BallotBloc>().add(
                  BallotEvent.updated(ballot: state.ballot),
                );
                if (state.ballot.reason == null) {
                  _textEditingController.clear();
                }
              }
            }
            if (state is BallotDetailFailure) {
              final snackBar = getSnackBar(
                context: context,
                message: state.error,
                status: SnackBarStatus.failure,
              );
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
        ),
      ],
      child: PopScope(
        canPop: true,
        onPopInvokedWithResult: (_, _) {
          context.read<BallotDetailBloc>().add(
            BallotDetailEvent.unsubscribe(ballot: widget.ballot),
          );
        },
        child: Scaffold(
          appBar: AppBar(
            leading: AutoLeadingButton(),
            title: Text('Ballot'),
            actions: [
              Container(
                margin: EdgeInsets.only(right: 15),
                child: BallotPopUp(ballot: widget.ballot),
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
                  if (widget.ballot.county != null)
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: GeoChipRow(
                        county: widget.ballot.county,
                        constituency: widget.ballot.constituency,
                        ward: widget.ballot.ward,
                      ),
                    ),
                  Text(
                    widget.ballot.title,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(height: 5),
                  Text(widget.ballot.description),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TimeLeft(
                        startTime: widget.ballot.startTime,
                        endTime: widget.ballot.endTime,
                      ),
                      Text(
                        '${widget.ballot.totalVotes} ${widget.ballot.totalVotes == 1 ? 'vote' : 'votes'}',
                        style: TextStyle(
                          color: Theme.of(context).disabledColor,
                        ),
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
                        ...widget.ballot.options.map((option) {
                          return AnimatedSwitcher(
                            duration: const Duration(milliseconds: 300),
                            child:
                                (!widget.ballot.isActive ||
                                    (userHasVoted && !changingVote))
                                ? BallotPercentIndicator(
                                    key: ValueKey(option.id),
                                    ballot: widget.ballot,
                                    option: option,
                                    animateToInitialPercent: true,
                                  )
                                : OptionTile(
                                    key: ValueKey(option.id),
                                    option: option,
                                    onTap: () {
                                      if (widget.ballot.isActive) {
                                        context.read<BallotDetailBloc>().add(
                                          BallotDetailEvent.vote(
                                            option: option,
                                          ),
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
                  userHasVoted && widget.ballot.isActive
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
                          ballot: widget.ballot,
                          controller: _textEditingController,
                        )
                      : SizedBox.shrink(),
                ],
              ),
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
      margin: EdgeInsets.symmetric(vertical: 5),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          height: optionHeight,
          padding: EdgeInsets.all(9),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondaryContainer,
            borderRadius: BorderRadius.all(const Radius.circular(8)),
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
    required this.ballot,
    required this.controller,
  });

  final Ballot ballot;
  final TextEditingController controller;

  @override
  State<ReasonWidget> createState() => _ReasonWidgetState();
}

class _ReasonWidgetState extends State<ReasonWidget> {
  bool canSubmit = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<BallotDetailBloc, BallotDetailState>(
      listener: (context, state) {
        if (state is BallotUpdated) {
          if (widget.ballot.id == state.ballot.id) {
            setState(() {
              canSubmit = false;
            });
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
              controller: widget.controller,
              onChanged: (value) {
                setState(() {
                  if (widget.controller.text.isEmpty &&
                          widget.ballot.reason == null ||
                      widget.controller.text == widget.ballot.reason?.text) {
                    canSubmit = false;
                  } else {
                    canSubmit = true;
                  }
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
                hoverColor: Colors.transparent,
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
                onPressed: canSubmit
                    ? () {
                        showDialog(
                          context: context,
                          builder: (context) => SubmissionDialog(
                            onYesPressed: () {
                              context.read<BallotDetailBloc>().add(
                                BallotDetailEvent.submitReason(
                                  ballot: widget.ballot,
                                  text: widget.controller.text,
                                ),
                              );
                            },
                          ),
                        );
                      }
                    : null,
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
        context.router.popTop();
        onYesPressed();
      },
      button2Text: 'No',
      onButton2Pressed: () {
        context.router.popTop();
      },
    );
  }
}
