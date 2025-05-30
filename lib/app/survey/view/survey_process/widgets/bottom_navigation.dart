import 'package:democracy/app/survey/bloc/survey-process/survey_bottom_navigation/survey_bottom_navigation_bloc.dart';
import 'package:democracy/app/survey/models/survey.dart';
import 'package:democracy/app/survey/view/survey_process/completion_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key, required this.survey, required});

  final Survey survey;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      color: Theme.of(context).canvasColor,
      child:
          BlocBuilder<SurveyBottomNavigationBloc, SurveyBottomNavigationState>(
            builder: (context, state) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed:
                        (state.isFirst)
                            ? null
                            : () {
                              context.read<SurveyBottomNavigationBloc>().add(
                                SurveyBottomNavigationEvent.loadPrevPage(
                                  survey: survey,
                                ),
                              );
                            },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          (state.isFirst)
                              ? Theme.of(context).disabledColor
                              : Theme.of(context).colorScheme.tertiaryContainer,
                      shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    child: Text('PREV'),
                  ),
                  Text(
                    'Page ${state.page + 1} of ${state.lastPage + 1}',
                    style: TextStyle(color: Theme.of(context).disabledColor),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      (state.isLast)
                          ? Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CompletionPage(),
                            ),
                          )
                          : context.read<SurveyBottomNavigationBloc>().add(
                            SurveyBottomNavigationEvent.loadNextPage(
                              survey: survey,
                            ),
                          );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Theme.of(context).colorScheme.tertiaryContainer,
                      shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    child: Text('NEXT'),
                  ),
                ],
              );
            },
          ),
    );
  }
}
