import 'package:democracy/ballot/view/ballot_tile.dart' show TimeLeft;
import 'package:democracy/survey/bloc/survey_detail/survey_detail_cubit.dart';
import 'package:democracy/survey/models/survey.dart';
import 'package:democracy/survey/view/survey_process/page.dart';
import 'package:democracy/survey/view/survey_process/response_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SurveyDetail extends StatefulWidget {
  const SurveyDetail({super.key, required this.survey});

  final Survey survey;

  @override
  State<SurveyDetail> createState() => _SurveyDetailState();
}

class _SurveyDetailState extends State<SurveyDetail> {
  late Survey _survey = widget.survey;

  @override
  Widget build(BuildContext context) {
    bool alreadyResponded = widget.survey.response != null;

    return BlocListener<SurveyDetailCubit, SurveyDetailState>(
      listener: (context, state) {
        if (state is SurveyUpdated) {
          if (_survey.id == state.survey.id) {
            setState(() {
              _survey = state.survey;
            });
          }
        }
      },
      child: Scaffold(
        appBar: AppBar(title: Text('Survey')),
        body: Container(
          margin: EdgeInsets.all(15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.survey.title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TimeLeft(
                    key: ValueKey(widget.survey),
                    startTime: widget.survey.startTime,
                    endTime: widget.survey.endTime,
                  ),
                  Text(
                    '${widget.survey.totalResponses} ${widget.survey.totalResponses == 1 ? 'response' : 'responses'}',
                    style: TextStyle(color: Theme.of(context).disabledColor),
                  ),
                ],
              ),
              SizedBox(height: 5),
              Text(widget.survey.description),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment:
                    alreadyResponded
                        ? MainAxisAlignment.spaceBetween
                        : MainAxisAlignment.end,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) =>
                                  SurveyProcessPage(survey: widget.survey),
                        ),
                      );
                    },
                    child: Text('Submit response'),
                  ),
                  if (alreadyResponded)
                    OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) =>
                                    ResponsePage(survey: widget.survey),
                          ),
                        );
                      },
                      child: Text('View response'),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
