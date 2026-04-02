import 'package:democracy/app/utils/snack_bar_content.dart';
import 'package:democracy/post/bloc/post_detail/post_detail_bloc.dart';
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

  void setIssue(Issue? issue) {
    setState(() {
      _issue = issue;
      _disabled = issue == null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PostDetailBloc, PostDetailState>(
      listener: (context, state) {
        switch (state) {
          case PostReported():
            final snackBar = getSnackBar(
              context: context,
              message: 'Reported',
              status: SnackBarStatus.info,
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
            Navigator.pop(context);
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
        body: RadioGroup<Issue>(
          groupValue: _issue,
          onChanged: setIssue,
          child: ListView(
            padding: const EdgeInsets.only(left: 20.0, top: 20.0, bottom: 20.0),
            children: [
              Text(
                "What type of issue are you reporting?",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              _buildOption(
                value: Issue.spam,
                title: 'Spam',
                subtitle: 'Fake engagement, scams, fake accounts, malicious links',
              ),
              _buildOption(
                value: Issue.hate,
                title: 'Hate',
                subtitle:
                'Slurs, racist or sexist stereotypes, dehumanization, '
                    'incitement of fear or discrimination, hateful symbols & logos',
                isThreeLine: true,
              ),
              _buildOption(
                value: Issue.abuseAndHarassment,
                title: 'Abuse & Harassment',
                subtitle:
                'Insults, targeted harassment and inciting harassment, '
                    'violent event denial',
              ),
              _buildOption(
                value: Issue.violentSpeech,
                title: 'Violent Speech',
                subtitle:
                'Violent threats, wish of harm, glorification of violence, '
                    'incitement of violence, coded incitement of violence',
              ),
              _buildOption(
                value: Issue.childSafety,
                title: 'Child Safety',
                subtitle: 'Child sexual exploitation, grooming, physical child abuse',
              ),
              _buildOption(
                value: Issue.privacy,
                title: 'Privacy',
                subtitle:
                'Sharing private information, threatening to share/expose '
                    'private information',
              ),
              _buildOption(
                value: Issue.suicideOrSelfHarm,
                title: 'Suicide or self-harm',
                subtitle:
                'Encouraging, promoting, providing instructions or sharing '
                    'strategies for self-harm',
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: OutlinedButton(
            style: ButtonStyle(
              padding: WidgetStateProperty.all(
                const EdgeInsets.symmetric(vertical: 15),
              ),
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            onPressed: _disabled
                ? null
                : () {
              context.read<PostDetailBloc>().add(
                PostDetailEvent.report(
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

  // Helper method to avoid code duplication
  Widget _buildOption({
    required Issue value,
    required String title,
    required String subtitle,
    bool isThreeLine = false,
  }) {
    return ListTile(
      onTap: () => setIssue(value),
      title: Text(title),
      subtitle: Text(subtitle),
      isThreeLine: isThreeLine,
      trailing: Radio<Issue>(
        value: value,
        // groupValue and onChanged are NO LONGER needed here
      ),
    );
  }
}