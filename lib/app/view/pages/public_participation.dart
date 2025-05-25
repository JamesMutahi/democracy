import 'package:democracy/app/bloc/survey/survey_bloc.dart';
import 'package:democracy/app/models/survey.dart';
import 'package:democracy/app/view/widgets/bottom_loader.dart';
import 'package:democracy/app/view/widgets/failure_retry_button.dart';
import 'package:democracy/app/view/widgets/loading_indicator.dart';
import 'package:democracy/app/view/widgets/no_results.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PublicParticipation extends StatefulWidget {
  const PublicParticipation({super.key});

  @override
  State<PublicParticipation> createState() => _PublicParticipationState();
}

class _PublicParticipationState extends State<PublicParticipation> {
  final _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    context.read<SurveyBloc>().add(SurveyEvent.initialize());
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<SurveyBloc, SurveyState>(
        builder: (context, state) {
          switch (state.status) {
            case SurveyStatus.success:
              List<Survey> surveys = state.surveys;
              return (surveys.isNotEmpty)
                  ? ListView.builder(
                    controller: _scrollController,
                    scrollDirection: Axis.vertical,
                    padding: const EdgeInsets.only(
                      left: 20.0,
                      right: 20.0,
                      bottom: 160,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return index >= surveys.length
                          ? const BottomLoader()
                          : SurveyTile(
                            key: ValueKey(index),
                            survey: surveys[index],
                          );
                    },
                    itemCount:
                        state.next == null
                            ? surveys.length
                            : surveys.length + 1,
                  )
                  : const NoResults();
            case SurveyStatus.failure:
              return FailureRetryButton(
                onPressed: () {
                  context.read<SurveyBloc>().add(const SurveyEvent.reload());
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
    if (_isBottom) context.read<SurveyBloc>().add(GetSurveys());
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

class SurveyTile extends StatelessWidget {
  const SurveyTile({super.key, required this.survey});

  final Survey survey;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      title: Text(survey.name),
      trailing: Icon(Icons.arrow_forward_ios),
      leading: Container(
        width: 5,
        margin: EdgeInsets.symmetric(vertical: 2.5),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.all(Radius.circular(50.0)),
        ),
      ),
    );
  }
}
