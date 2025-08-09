import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/utils/view/bottom_loader.dart';
import 'package:democracy/app/utils/view/failure_retry_button.dart';
import 'package:democracy/notification/models/preferences.dart';
import 'package:democracy/notification/bloc/preferences/preferences_cubit.dart';
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
    bool? tagNotificationsOn,
    bool? likeNotificationsOn,
    bool? replyNotificationsOn,
    bool? repostNotificationsOn,
    bool? messageNotificationsOn,
    bool? followNotificationsOn,
  }) {
    context.read<WebsocketBloc>().add(
      WebsocketEvent.updatePreferences(
        allowNotifications:
            allowNotifications ?? preferences.allowNotifications,
        tagNotificationsOn: tagNotificationsOn ?? preferences.tagNotifications,
        likeNotificationsOn:
            likeNotificationsOn ?? preferences.likeNotifications,
        replyNotificationsOn:
            replyNotificationsOn ?? preferences.replyNotifications,
        repostNotificationsOn:
            repostNotificationsOn ?? preferences.repostNotifications,
        messageNotificationsOn:
            messageNotificationsOn ?? preferences.messageNotifications,
        followNotificationsOn:
            followNotificationsOn ?? preferences.followNotifications,
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
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          Switch(
                            value: preferences.allowNotifications,
                            onChanged: (value) {
                              setState(() {
                                updatePreferences(
                                  allowNotifications: value,
                                  tagNotificationsOn: value,
                                  likeNotificationsOn: value,
                                  replyNotificationsOn: value,
                                  repostNotificationsOn: value,
                                  messageNotificationsOn: value,
                                  followNotificationsOn: value,
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
                                          ).textTheme.titleLarge,
                                    ),
                                    const SizedBox(height: 10),
                                    const Text(
                                      'Select which post activity you would like to '
                                      'receive notifications on.',
                                    ),
                                    SwitchRow(
                                      text: 'Tags',
                                      value: preferences.tagNotifications,
                                      onChanged: (value) {
                                        updatePreferences(
                                          tagNotificationsOn: value,
                                        );
                                      },
                                    ),
                                    SwitchRow(
                                      text: 'Likes',
                                      value: preferences.likeNotifications,
                                      onChanged: (value) {
                                        updatePreferences(
                                          likeNotificationsOn: value,
                                        );
                                      },
                                    ),
                                    SwitchRow(
                                      text: 'Replies',
                                      value: preferences.replyNotifications,
                                      onChanged: (value) {
                                        updatePreferences(
                                          replyNotificationsOn: value,
                                        );
                                      },
                                    ),
                                    SwitchRow(
                                      text: 'Reposts',
                                      value: preferences.repostNotifications,
                                      onChanged: (value) {
                                        updatePreferences(
                                          repostNotificationsOn: value,
                                        );
                                      },
                                    ),
                                    const SizedBox(height: 20),
                                    Text(
                                      'Messages',
                                      style:
                                          Theme.of(
                                            context,
                                          ).textTheme.titleLarge,
                                    ),
                                    SwitchRow(
                                      text:
                                          'Receive notifications on new messages',
                                      value: preferences.messageNotifications,
                                      onChanged: (value) {
                                        updatePreferences(
                                          messageNotificationsOn: value,
                                        );
                                      },
                                    ),
                                    const SizedBox(height: 20),
                                    Text(
                                      'Followers',
                                      style:
                                          Theme.of(
                                            context,
                                          ).textTheme.titleLarge,
                                    ),
                                    SwitchRow(
                                      text:
                                          'Receive notifications on new followers',
                                      value: preferences.followNotifications,
                                      onChanged: (value) {
                                        updatePreferences(
                                          followNotificationsOn: value,
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
