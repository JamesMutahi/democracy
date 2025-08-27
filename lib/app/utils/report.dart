import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/utils/snack_bar_content.dart';
import 'package:democracy/post/bloc/post_detail/post_detail_cubit.dart';
import 'package:democracy/post/models/post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/symbols.dart';

enum Issue {
  hate,
  abuseAndHarassment,
  violentSpeech,
  childSafety,
  privacy,
  spam,
  suicideOrSelfHarm,
}

Map<Issue, String> issues = {
  Issue.hate: 'Hate',
  Issue.abuseAndHarassment: 'Abuse & Harassment',
  Issue.violentSpeech: 'Violent Speech',
  Issue.childSafety: 'Child Safety',
  Issue.privacy: 'Privacy',
  Issue.spam: 'Spam',
  Issue.suicideOrSelfHarm: 'Suicide or Self-Harm',
};

class ReportModal extends StatefulWidget {
  const ReportModal({super.key, required this.post});

  final Post post;

  @override
  State<ReportModal> createState() => _ReportModalState();
}

class _ReportModalState extends State<ReportModal> {
  Issue? _issue;
  bool _disabled = true;

  void setIssue(issue) {
    setState(() {
      _issue = issue;
      _disabled = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PostDetailCubit, PostDetailState>(
      listener: (context, state) {
        switch (state) {
          case PostReported():
            final snackBar = getSnackBar(
              context: context,
              message: 'Reported',
              status: SnackBarStatus.info,
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
            Navigator.of(context).pop();
          case PostDetailFailure(:final error):
            final snackBar = getSnackBar(
              context: context,
              message: error,
              status: SnackBarStatus.failure,
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Report'),
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Symbols.close_rounded),
              ),
            ],
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.only(left: 20.0, top: 20.0, bottom: 20.0),
          children: [
            Text(
              "What type of issue are you reporting?",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            // const SizedBox(height: 10.0),
            ListTile(
              onTap: () {
                setIssue(Issue.spam);
              },
              title: const Text('Spam'),
              subtitle: const Text(
                'Fake engagement, scams, fake accounts, malicious links',
              ),
              trailing: Radio<Issue>(
                value: Issue.spam,
                groupValue: _issue,
                onChanged: (Issue? value) {
                  setIssue(value);
                },
              ),
            ),
            ListTile(
              onTap: () {
                setIssue(Issue.hate);
              },
              title: const Text('Hate'),
              subtitle: const Text(
                'Slurs, racist or sexist stereotypes, dehumanization, '
                'incitement of fear or discrimination, hateful symbols '
                '& logos',
              ),
              isThreeLine: true,
              trailing: Radio<Issue>(
                value: Issue.hate,
                groupValue: _issue,
                onChanged: (Issue? value) {
                  setIssue(value);
                },
              ),
            ),
            ListTile(
              onTap: () {
                setIssue(Issue.abuseAndHarassment);
              },
              title: const Text('Abuse & Harassment'),
              subtitle: const Text(
                'Insults, targeted harassment and inciting harassment, '
                'violent event denial ',
              ),
              trailing: Radio<Issue>(
                value: Issue.abuseAndHarassment,
                groupValue: _issue,
                onChanged: (Issue? value) {
                  setIssue(value);
                },
              ),
            ),
            ListTile(
              onTap: () {
                setIssue(Issue.violentSpeech);
              },
              title: const Text('Violent Speech'),
              subtitle: const Text(
                'Violent threats, wish of harm, glorification of violence, '
                'incitement of violence, coded incitement of violence',
              ),
              trailing: Radio<Issue>(
                value: Issue.violentSpeech,
                groupValue: _issue,
                onChanged: (Issue? value) {
                  setIssue(value);
                },
              ),
            ),
            ListTile(
              onTap: () {
                setIssue(Issue.childSafety);
              },
              title: const Text('Child Safety'),
              subtitle: const Text(
                'Child sexual exploitation, grooming, physical child abuse',
              ),
              trailing: Radio<Issue>(
                value: Issue.childSafety,
                groupValue: _issue,
                onChanged: (Issue? value) {
                  setIssue(value);
                },
              ),
            ),
            ListTile(
              onTap: () {
                setIssue(Issue.privacy);
              },
              title: const Text('Privacy'),
              subtitle: const Text(
                'Sharing private information, threatening to share/expose '
                'private information',
              ),
              trailing: Radio<Issue>(
                value: Issue.privacy,
                groupValue: _issue,
                onChanged: (Issue? value) {
                  setIssue(value);
                },
              ),
            ),
            ListTile(
              onTap: () {
                setIssue(Issue.suicideOrSelfHarm);
              },
              title: const Text('Suicide or self-harm'),
              subtitle: const Text(
                'Encouraging, promoting, providing instructions or sharing '
                'strategies for self-harm',
              ),
              trailing: Radio<Issue>(
                value: Issue.suicideOrSelfHarm,
                groupValue: _issue,
                onChanged: (Issue? value) {
                  setIssue(value);
                },
              ),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: OutlinedButton(
            style: ButtonStyle(
              padding: WidgetStateProperty.all(
                EdgeInsets.symmetric(vertical: 15),
              ),
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            onPressed:
                _disabled
                    ? null
                    : () {
                      context.read<WebsocketBloc>().add(
                        WebsocketEvent.reportPost(
                          issue: issues[_issue]!,
                          post: widget.post,
                        ),
                      );
                    },
            child: const Text('Report'),
          ),
        ),
      ),
    );
  }
}
