import 'package:democracy/app/shared/widgets/bottom_loader.dart';
import 'package:democracy/notification/bloc/preferences/preferences_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PreferencesPage extends StatefulWidget {
  const PreferencesPage({super.key});

  @override
  State<PreferencesPage> createState() => _PreferencesPageState();
}

class _PreferencesPageState extends State<PreferencesPage> {
  @override
  void initState() {
    context.read<PreferencesBloc>().add(PreferencesEvent.get());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Preferences')),
      body: BlocBuilder<PreferencesBloc, PreferencesState>(
        builder: (context, state) {
          final preferences = state.preferences;

          void updatePreferences({
            bool? allowNotifications,
            bool? allowTagNotifications,
            bool? allowLikeNotifications,
            bool? allowReplyNotifications,
            bool? allowRepostNotifications,
            bool? allowMessageNotifications,
            bool? allowFollowNotifications,
            bool? allowPetitionNotifications,
            bool? allowPetitionSupporterNotifications,
          }) {
            context.read<PreferencesBloc>().add(
              PreferencesEvent.update(
                allowNotifications:
                    allowNotifications ?? preferences!.allowNotifications,
                allowTagNotifications:
                    allowTagNotifications ?? preferences!.allowTagNotifications,
                allowLikeNotifications:
                    allowLikeNotifications ??
                    preferences!.allowLikeNotifications,
                allowReplyNotifications:
                    allowReplyNotifications ??
                    preferences!.allowReplyNotifications,
                allowRepostNotifications:
                    allowRepostNotifications ??
                    preferences!.allowRepostNotifications,
                allowMessageNotifications:
                    allowMessageNotifications ??
                    preferences!.allowMessageNotifications,
                allowFollowNotifications:
                    allowFollowNotifications ??
                    preferences!.allowFollowNotifications,
                allowPetitionNotifications:
                    allowPetitionNotifications ??
                    preferences!.allowPetitionNotifications,
                allowPetitionSupporterNotifications:
                    allowPetitionSupporterNotifications ??
                    preferences!.allowPetitionSupporterNotifications,
              ),
            );
          }

          return preferences == null
              ? BottomLoader()
              : Container(
                  margin: const EdgeInsets.only(left: 15, right: 15),
                  child: ListView(
                    padding: const EdgeInsets.only(top: 10, bottom: 20),
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Notifications',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Switch(
                            value: preferences.allowNotifications,
                            onChanged: (value) {
                              updatePreferences(
                                allowNotifications: value,
                                allowTagNotifications: value,
                                allowLikeNotifications: value,
                                allowReplyNotifications: value,
                                allowRepostNotifications: value,
                                allowMessageNotifications: value,
                                allowFollowNotifications: value,
                                allowPetitionNotifications: value,
                                allowPetitionSupporterNotifications: value,
                              );
                            },
                          ),
                        ],
                      ),
                      const Text(
                        'New followers, tags, replies, likes, the latest posts on '
                        'the people you follow... Turn on notifications and never '
                        'miss an update again!',
                      ),
                      const SizedBox(height: 20),
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        child: (!preferences.allowNotifications)
                            ? const SizedBox()
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Posts',
                                    style: Theme.of(
                                      context,
                                    ).textTheme.titleMedium,
                                  ),
                                  const SizedBox(height: 10),
                                  const Text(
                                    'Select which post activity you would like to '
                                    'receive notifications on.',
                                  ),
                                  SwitchRow(
                                    text: 'Tags',
                                    value: preferences.allowTagNotifications,
                                    onChanged: (value) {
                                      updatePreferences(
                                        allowTagNotifications: value,
                                      );
                                    },
                                  ),
                                  SwitchRow(
                                    text: 'Likes',
                                    value: preferences.allowLikeNotifications,
                                    onChanged: (value) {
                                      updatePreferences(
                                        allowLikeNotifications: value,
                                      );
                                    },
                                  ),
                                  SwitchRow(
                                    text: 'Replies',
                                    value: preferences.allowReplyNotifications,
                                    onChanged: (value) {
                                      updatePreferences(
                                        allowReplyNotifications: value,
                                      );
                                    },
                                  ),
                                  SwitchRow(
                                    text: 'Reposts',
                                    value: preferences.allowRepostNotifications,
                                    onChanged: (value) {
                                      updatePreferences(
                                        allowRepostNotifications: value,
                                      );
                                    },
                                  ),
                                  const SizedBox(height: 20),
                                  Text(
                                    'Messages',
                                    style: Theme.of(
                                      context,
                                    ).textTheme.titleMedium,
                                  ),
                                  SwitchRow(
                                    text:
                                        'Receive notifications on new messages',
                                    value:
                                        preferences.allowMessageNotifications,
                                    onChanged: (value) {
                                      updatePreferences(
                                        allowMessageNotifications: value,
                                      );
                                    },
                                  ),
                                  const SizedBox(height: 20),
                                  Text(
                                    'Followers',
                                    style: Theme.of(
                                      context,
                                    ).textTheme.titleMedium,
                                  ),
                                  SwitchRow(
                                    text:
                                        'Receive notifications on new followers',
                                    value: preferences.allowFollowNotifications,
                                    onChanged: (value) {
                                      updatePreferences(
                                        allowFollowNotifications: value,
                                      );
                                    },
                                  ),
                                  const SizedBox(height: 20),
                                  Text(
                                    'Petitions',
                                    style: Theme.of(
                                      context,
                                    ).textTheme.titleMedium,
                                  ),
                                  const SizedBox(height: 10),
                                  const Text(
                                    'Select which petition activity you would like to '
                                    'receive notifications on.',
                                  ),
                                  const SizedBox(height: 10),
                                  SwitchRow(
                                    text: 'Petitions (from people you follow)',
                                    value:
                                        preferences.allowPetitionNotifications,
                                    onChanged: (value) {
                                      updatePreferences(
                                        allowPetitionNotifications: value,
                                      );
                                    },
                                  ),
                                  SwitchRow(
                                    text: 'Supporters (of your petitions)',
                                    value: preferences
                                        .allowPetitionSupporterNotifications,
                                    onChanged: (value) {
                                      updatePreferences(
                                        allowPetitionSupporterNotifications:
                                            value,
                                      );
                                    },
                                  ),
                                ],
                              ),
                      ),
                    ],
                  ),
                );
        },
      ),
    );
  }
}

class SwitchRow extends StatelessWidget {
  const SwitchRow({
    super.key,
    required this.text,
    required this.value,
    required this.onChanged,
  });

  final String text;
  final bool value;
  final void Function(bool) onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text),
        Switch(value: value, onChanged: onChanged),
      ],
    );
  }
}
