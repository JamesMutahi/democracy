import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/utils/bottom_loader.dart';
import 'package:democracy/app/utils/failure_retry_button.dart';
import 'package:democracy/notification/bloc/preferences/preferences_cubit.dart';
import 'package:democracy/notification/models/preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PreferencesPage extends StatefulWidget {
  const PreferencesPage({super.key});

  @override
  State<PreferencesPage> createState() => _PreferencesPageState();
}

class _PreferencesPageState extends State<PreferencesPage> {
  bool loading = true;
  bool failure = false;
  late Preferences preferences;

  @override
  void initState() {
    context.read<WebsocketBloc>().add(WebsocketEvent.getPreferences());
    super.initState();
  }

  void updatePreferences({
    bool? allowNotifications,
    bool? allowTagNotifications,
    bool? allowLikeNotifications,
    bool? allowReplyNotifications,
    bool? allowRepostNotifications,
    bool? allowMessageNotifications,
    bool? allowFollowNotifications,
  }) {
    context.read<WebsocketBloc>().add(
      WebsocketEvent.updatePreferences(
        allowNotifications:
            allowNotifications ?? preferences.allowNotifications,
        allowTagNotifications:
            allowTagNotifications ?? preferences.allowTagNotifications,
        allowLikeNotifications:
            allowLikeNotifications ?? preferences.allowLikeNotifications,
        allowReplyNotifications:
            allowReplyNotifications ?? preferences.allowReplyNotifications,
        allowRepostNotifications:
            allowRepostNotifications ?? preferences.allowRepostNotifications,
        allowMessageNotifications:
            allowMessageNotifications ?? preferences.allowMessageNotifications,
        allowFollowNotifications:
            allowFollowNotifications ?? preferences.allowFollowNotifications,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Preferences')),
      body: BlocListener<PreferencesCubit, PreferencesState>(
        listener: (context, state) {
          if (state is PreferencesLoaded) {
            setState(() {
              preferences = state.preferences;
              loading = false;
              failure = false;
            });
          }
        },
        child:
            loading
                ? BottomLoader()
                : failure
                ? FailureRetryButton(
                  onPressed: () {
                    context.read<WebsocketBloc>().add(
                      WebsocketEvent.getPreferences(),
                    );
                  },
                )
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
                              setState(() {
                                updatePreferences(
                                  allowNotifications: value,
                                  allowTagNotifications: value,
                                  allowLikeNotifications: value,
                                  allowReplyNotifications: value,
                                  allowRepostNotifications: value,
                                  allowMessageNotifications: value,
                                  allowFollowNotifications: value,
                                );
                              });
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
                        child:
                            (!preferences.allowNotifications)
                                ? const SizedBox()
                                : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Posts',
                                      style:
                                          Theme.of(
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
                                      value:
                                          preferences.allowReplyNotifications,
                                      onChanged: (value) {
                                        updatePreferences(
                                          allowReplyNotifications: value,
                                        );
                                      },
                                    ),
                                    SwitchRow(
                                      text: 'Reposts',
                                      value:
                                          preferences.allowRepostNotifications,
                                      onChanged: (value) {
                                        updatePreferences(
                                          allowRepostNotifications: value,
                                        );
                                      },
                                    ),
                                    const SizedBox(height: 20),
                                    Text(
                                      'Messages',
                                      style:
                                          Theme.of(
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
                                      style:
                                          Theme.of(
                                            context,
                                          ).textTheme.titleMedium,
                                    ),
                                    SwitchRow(
                                      text:
                                          'Receive notifications on new followers',
                                      value:
                                          preferences.allowFollowNotifications,
                                      onChanged: (value) {
                                        updatePreferences(
                                          allowFollowNotifications: value,
                                        );
                                      },
                                    ),
                                  ],
                                ),
                      ),
                    ],
                  ),
                ),
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
      children: [Text(text), Switch(value: value, onChanged: onChanged)],
    );
  }
}
