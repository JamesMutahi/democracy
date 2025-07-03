import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
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
    bool pollHasEnded =
        _poll.endTime.difference(DateTime.now()) < Duration(seconds: 0);
    bool userHasVoted = _poll.votedOption != null;
    return BlocListener<PollDetailCubit, PollDetailState>(
      listener: (context, state) {
        if (state is PollUpdated) {
          if (_poll.id == state.poll.id) {
            setState(() {
              _poll = state.poll;
            });
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
                ..._poll.options.map((option) {
                  return AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child:
                        (pollHasEnded || userHasVoted && !changingVote)
                            ? PollPercentIndicator(poll: _poll, option: option)
                            : OptionTile(
                              option: option,
                              onTap: () {
                                context.read<WebsocketBloc>().add(
                                  WebsocketEvent.vote(option: option),
                                );
                                setState(() {
                                  changingVote = false;
                                });
                              },
                            ),
                  );
                }),
                userHasVoted
                    ? changingVote
                        ? SizedBox.shrink()
                        : Align(
                          alignment: Alignment.topRight,
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                changingVote = true;
                              });
                            },
                            child: Text('Change'),
                          ),
                        )
                    : SizedBox.shrink(),
                pollHasEnded
                    ? Text(_poll.reason == null ? '' : _poll.reason!.text)
                    : !changingVote
                    ? ReasonWidget(controller: _controller, poll: _poll)
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
  const ReasonWidget({super.key, required this.controller, required this.poll});

  final TextEditingController controller;
  final Poll poll;

  @override
  State<ReasonWidget> createState() => _ReasonWidgetState();
}

class _ReasonWidgetState extends State<ReasonWidget> {
  bool submitButtonDisabled = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Share your reason"),
              Text(
                "This is optional but will help to better understand "
                "why people reject or accept an option. Your "
                "contribution is greatly appreciated.",
                style: TextStyle(color: Theme.of(context).hintColor),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          reverse: true,
          child: TextFormField(
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
        Align(
          alignment: Alignment.topRight,
          child: ElevatedButton(
            onPressed:
                widget.controller.text == ''
                    ? null
                    : () {
                      context.read<WebsocketBloc>().add(
                        WebsocketEvent.submitReason(
                          poll: widget.poll,
                          text: widget.controller.text,
                        ),
                      );
                    },
            child: Text('Submit'),
          ),
        ),
      ],
    );
  }
}
