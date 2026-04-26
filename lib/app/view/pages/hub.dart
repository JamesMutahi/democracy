import 'package:democracy/app/bloc/websocket/websocket_service.dart';
import 'package:democracy/app/view/widgets/custom_appbar.dart';
import 'package:democracy/ballot/bloc/ballots/ballots_bloc.dart';
import 'package:democracy/ballot/view/ballot_page.dart';
import 'package:democracy/meet/bloc/meetings/meetings_bloc.dart';
import 'package:democracy/meet/view/meeting_page.dart';
import 'package:democracy/petition/bloc/petitions/petitions_bloc.dart';
import 'package:democracy/petition/view/petition_page.dart';
import 'package:democracy/survey/bloc/surveys/surveys_bloc.dart';
import 'package:democracy/survey/view/survey_page.dart';
import 'package:democracy/user/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/symbols.dart';

class Hub extends StatefulWidget {
  const Hub({super.key, required this.user, required this.notifications});

  final User user;
  final int notifications;

  @override
  State<Hub> createState() => _HubState();
}

class _HubState extends State<Hub> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, bool innerBoxIsScrolled) {
        return [
          CustomAppBar(
            user: widget.user,
            notifications: widget.notifications,
            middle: Text('Hub', style: Theme.of(context).textTheme.titleLarge),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(60.0),
              child: CustomSearchBar(
                controller: _controller,
                hintText: 'Search',
                filterCount: 0,
                onChanged: (value) {},
                onFilterTap: () {
                  showGeneralDialog(
                    context: context,
                    transitionDuration: const Duration(milliseconds: 300),
                    pageBuilder: (context, animation, secondaryAnimation) {
                      return Container();
                    },
                  );
                },
              ),
            ),
          ),
        ];
      },
      body: GridView.count(
        padding: EdgeInsets.all(15),
        crossAxisCount: 2,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        children: [
          _HubCard(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BlocProvider(
                    create: (context) => BallotsBloc(
                      webSocketService: context.read<WebSocketService>(),
                    ),
                    child: BallotPage(),
                  ),
                ),
              );
            },
            iconData: Symbols.how_to_vote_rounded,
            text: 'Ballot',
          ),
          _HubCard(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BlocProvider(
                    create: (context) => SurveysBloc(
                      webSocketService: context.read<WebSocketService>(),
                    ),
                    child: SurveyPage(),
                  ),
                ),
              );
            },
            iconData: Symbols.assignment_rounded,
            text: 'Survey',
          ),
          _HubCard(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BlocProvider(
                    create: (context) => MeetingsBloc(
                      webSocketService: context.read<WebSocketService>(),
                    ),
                    child: MeetingPage(),
                  ),
                ),
              );
            },
            iconData: Symbols.mic_rounded,
            text: 'Meeting',
          ),
          _HubCard(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BlocProvider(
                    create: (context) => PetitionsBloc(
                      webSocketService: context.read<WebSocketService>(),
                    ),
                    child: PetitionPage(),
                  ),
                ),
              );
            },
            iconData: Symbols.edit_document_rounded,
            text: 'Petition',
          ),
        ],
      ),
    );
  }
}

class _HubCard extends StatelessWidget {
  const _HubCard({
    required this.onTap,
    required this.iconData,
    required this.text,
  });

  final VoidCallback onTap;
  final IconData iconData;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card.filled(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(iconData, size: 40),
            SizedBox(height: 10),
            Text(text),
          ],
        ),
      ),
    );
  }
}
