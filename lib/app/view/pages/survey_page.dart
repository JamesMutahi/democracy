import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/survey/view/surveys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SurveyPage extends StatefulWidget {
  const SurveyPage({super.key});

  @override
  State<SurveyPage> createState() => _SurveyPageState();
}

class _SurveyPageState extends State<SurveyPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    context.read<WebsocketBloc>().add(WebsocketEvent.getSurveys());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Surveys();
  }
}
