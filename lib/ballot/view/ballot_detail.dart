import 'package:auto_route/auto_route.dart';
import 'package:democracy/app/bloc/services/websocket_service.dart'
    show WebsocketStatus, WebSocketService;
import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/shared/widgets/active_scroll_controller.dart';
import 'package:democracy/app/shared/widgets/bottom_loader.dart';
import 'package:democracy/app/shared/widgets/dialogs.dart';
import 'package:democracy/app/shared/widgets/failure_retry_button.dart';
import 'package:democracy/app/shared/widgets/snack_bar_content.dart';
import 'package:democracy/app/shared/widgets/main_container.dart';
import 'package:democracy/ballot/bloc/ballot/ballot_bloc.dart';
import 'package:democracy/ballot/bloc/ballot_detail/ballot_detail_bloc.dart';
import 'package:democracy/ballot/models/ballot.dart';
import 'package:democracy/ballot/models/option.dart';
import 'package:democracy/ballot/view/widgets/ballot_tile.dart';
import 'package:democracy/ballot/view/widgets/summary.dart';
import 'package:democracy/geo/view/widgets/geo_chip.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';

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
      child: MainContainer(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Ballot'),
            centerTitle: true,
            actions: [
              BlocBuilder<BallotBloc, BallotState>(
                buildWhen: (previous, current) => current.ballotId == ballotId,
                builder: (context, state) {
                  if (state.ballot == null) return const SizedBox.shrink();
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: BallotPopUp(ballot: state.ballot!),
                  );
                },
              ),
            ],
          ),
          body: BlocBuilder<BallotBloc, BallotState>(
            buildWhen: (previous, current) => current.ballotId == ballotId,
            builder: (context, state) {
              if (state.status == BallotStatus.initial ||
                  (state.status == BallotStatus.loading &&
                      state.ballot == null)) {
                return const Center(child: BottomLoader());
              }
              if (state.status == BallotStatus.failure &&
                  state.ballot == null) {
                return Center(
                  child: FailureRetryButton(
                    onPressed: () {
                      context.read<BallotBloc>().add(
                        BallotEvent.load(ballotId: ballotId),
                      );
                    },
                  ),
                );
              }
              return _BallotDetail(ballot: state.ballot!);
            },
          ),
        ),
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
  final ScrollController _scrollController = ScrollController();
  bool _changingVote = false;
  late final TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController(
      text: widget.ballot.reason ?? '',
    );
    // Register the initial active controller
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ActiveScrollController.activate(_scrollController);
    });
  }

  @override
  void didUpdateWidget(covariant _BallotDetail oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.ballot.reason != widget.ballot.reason) {
      _textEditingController.text = widget.ballot.reason ?? '';
      _textEditingController.selection = TextSelection.fromPosition(
        TextPosition(offset: _textEditingController.text.length),
      );
    }
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    // Clear the registry when leaving
    ActiveScrollController.deactivate(_scrollController);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final userHasVoted = widget.ballot.votedOption != null;
    final isVotingActive = widget.ballot.isActive && !widget.ballot.hasEnded;
    final responsive = ResponsiveBreakpoints.of(context);
    final isWebLayout = kIsWeb && responsive.largerThan(MOBILE);

    return MultiBlocListener(
      listeners: [
        BlocListener<WebsocketBloc, WebsocketState>(
          listener: (context, state) {
            if (state.status == WebsocketStatus.connected) {
              context.read<BallotBloc>().add(
                BallotEvent.load(ballotId: widget.ballot.id),
              );
            }
          },
        ),
        BlocListener<BallotDetailBloc, BallotDetailState>(
          listener: (context, state) {
            switch (state) {
              case BallotUpdated():
                if (widget.ballot.id == state.ballotId) {
                  context.read<BallotBloc>().add(
                    BallotEvent.ballotDetailUpdated(
                      title: state.title,
                      description: state.description,
                      county: state.county,
                      constituency: state.constituency,
                      ward: state.ward,
                      startTime: state.startTime,
                      endTime: state.endTime,
                      hasStarted: state.hasStarted,
                      hasEnded: state.hasEnded,
                      totalVotes: state.totalVotes,
                      options: state.options,
                      isActive: state.isActive,
                    ),
                  );
                }
              case BallotVoted():
                if (widget.ballot.id == state.ballotId) {
                  context.read<BallotBloc>().add(
                    BallotEvent.votedOptionUpdated(
                      votedOptionId: state.optionId,
                    ),
                  );
                  if (state.hasChanged) {
                    _textEditingController.clear();
                  }
                }
              case BallotReasonSubmitted():
                if (widget.ballot.id == state.ballotId &&
                    state.reason != widget.ballot.reason) {
                  if (state.reason == null) _textEditingController.clear();
                  context.read<BallotBloc>().add(
                    BallotEvent.reasonUpdated(reason: state.reason),
                  );
                  if (mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      getSnackBar(
                        context: context,
                        message: 'Reason submitted',
                        status: SnackBarStatus.success,
                      ),
                    );
                  }
                }
              case BallotDetailFailure():
                if (mounted) {
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).showSnackBar(
                    getSnackBar(
                      context: context,
                      message: state.error,
                      status: SnackBarStatus.failure,
                    ),
                  );
                }
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
        child: SingleChildScrollView(
          controller: _scrollController,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Header Section
              if (widget.ballot.county != null) ...[
                GeoChipRow(
                  county: widget.ballot.county,
                  constituency: widget.ballot.constituency,
                  ward: widget.ballot.ward,
                ),
                const SizedBox(height: 12),
              ],
              Text(
                widget.ballot.title,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                widget.ballot.description,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 16),

              // Meta Info Row
              Row(
                children: [
                  Expanded(
                    child: TimeLeft(
                      startTime: widget.ballot.startTime,
                      endTime: widget.ballot.endTime,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: colorScheme.surfaceContainerHighest,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.how_to_vote_outlined,
                          size: 16,
                          color: colorScheme.onSurfaceVariant,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${widget.ballot.totalVotes} ${widget.ballot.totalVotes == 1 ? 'vote' : 'votes'}',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: colorScheme.surfaceContainerLow,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: colorScheme.outlineVariant.withValues(alpha: 0.5),
                  ),
                ),
                child: Column(
                  children: widget.ballot.options.map((option) {
                    final isSelected = widget.ballot.votedOption == option.id;
                    return AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      child:
                          (!isVotingActive || (userHasVoted && !_changingVote))
                          ? BallotPercentIndicator(
                              key: ValueKey('percent_${option.id}'),
                              ballot: widget.ballot,
                              option: option,
                              animateToInitialPercent: true,
                            )
                          : OptionTile(
                              key: ValueKey('option_${option.id}'),
                              option: option,
                              isSelected: isSelected,
                              onTap: () {
                                if (isVotingActive) {
                                  context.read<BallotDetailBloc>().add(
                                    BallotDetailEvent.vote(option: option),
                                  );
                                  setState(() => _changingVote = false);
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    getSnackBar(
                                      context: context,
                                      message: 'Voting is closed',
                                      status: SnackBarStatus.info,
                                    ),
                                  );
                                }
                              },
                            ),
                    );
                  }).toList(),
                ),
              ),

              if (userHasVoted && isVotingActive && !_changingVote)
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: OutlinedButton.icon(
                      onPressed: () => setState(() => _changingVote = true),
                      icon: const Icon(Icons.edit_rounded, size: 18),
                      label: const Text('Change Vote'),
                    ),
                  ),
                ),

              const SizedBox(height: 24),

              if (!_changingVote && !widget.ballot.hasEnded)
                ReasonWidget(
                  ballot: widget.ballot,
                  controller: _textEditingController,
                ),

              if (widget.ballot.hasEnded) ...[
                const SizedBox(height: 8),
                if (widget.ballot.reason != null)
                  Card.filled(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.lightbulb,
                                color: colorScheme.primary,
                                size: 20,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'Your Reason',
                                style: Theme.of(context).textTheme.titleMedium
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Text(
                            widget.ballot.reason!,
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(color: colorScheme.onSurfaceVariant),
                          ),
                        ],
                      ),
                    ),
                  ),
                const SizedBox(height: 16),
                BallotSummaryWidget(summary: widget.ballot.summary!),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class OptionTile extends StatelessWidget {
  const OptionTile({
    super.key,
    required this.option,
    required this.onTap,
    required this.isSelected,
  });

  final Option option;
  final VoidCallback? onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected
              ? colorScheme.primaryContainer
              : colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected
                ? colorScheme.primary
                : colorScheme.outlineVariant,
            width: isSelected ? 1.5 : 1,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                option.text,
                style: TextStyle(
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                  color: isSelected
                      ? colorScheme.onPrimaryContainer
                      : colorScheme.onSurface,
                ),
              ),
            ),
            Icon(
              isSelected
                  ? Icons.radio_button_checked_rounded
                  : Icons.radio_button_unchecked_rounded,
              color: isSelected ? colorScheme.primary : colorScheme.outline,
              size: 24,
            ),
          ],
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
  bool get _canSubmit {
    final text = widget.controller.text.trim();
    final reason = widget.ballot.reason;
    return text.isNotEmpty && text != reason;
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return BlocListener<BallotDetailBloc, BallotDetailState>(
      listener: (context, state) {
        if (state is BallotReasonSubmitted &&
            widget.ballot.id == state.ballotId) {
          setState(() {}); // Trigger rebuild to reevaluate _canSubmit
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Divider(height: 32),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.lightbulb_outline,
                size: 20,
                color: colorScheme.primary,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Your reason for this decision is greatly appreciated and helps us understand what people want.',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: widget.controller,
            onChanged: (_) => setState(() {}),
            readOnly:
                !widget.ballot.isActive ||
                !widget.ballot.hasStarted ||
                widget.ballot.hasEnded,
            minLines: 3,
            maxLines: 6,
            maxLength: widget.ballot.isActive ? 300 : null,
            keyboardType: TextInputType.multiline,
            onTapOutside: (_) => FocusScope.of(context).unfocus(),
            decoration: InputDecoration(
              hintText: 'Enter your reason (optional)',
              filled: true,
              fillColor: colorScheme.surfaceContainerHighest,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: colorScheme.primary, width: 2),
              ),
            ),
          ),
          const SizedBox(height: 16),
          if (widget.ballot.isActive)
            Align(
              alignment: Alignment.centerRight,
              child: FilledButton.icon(
                onPressed: _canSubmit
                    ? () {
                        showDialog(
                          context: context,
                          builder: (context) => SubmissionDialog(
                            onYesPressed: () {
                              context.read<BallotDetailBloc>().add(
                                BallotDetailEvent.submitReason(
                                  ballot: widget.ballot,
                                  text: widget.controller.text.trim(),
                                ),
                              );
                              if (context.mounted) context.router.popTop();
                            },
                          ),
                        );
                      }
                    : null,
                icon: const Icon(Icons.send_rounded, size: 18),
                label: const Text('Submit Reason'),
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
      elevatedButtonText: 'Yes',
      onElevatedButtonPressed: () {
        context.router.popTop();
        onYesPressed();
      },
      textButtonText: 'No',
      onTextButtonPressed: () {
        context.router.popTop();
      },
    );
  }
}
