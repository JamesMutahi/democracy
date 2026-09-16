import 'package:auto_route/auto_route.dart';
import 'package:democracy/app/shared/widgets/active_scroll_controller.dart';
import 'package:democracy/app/shared/widgets/bottom_loader.dart';
import 'package:democracy/app/shared/widgets/main_container.dart';
import 'package:democracy/notification/bloc/preferences/preferences_bloc.dart';
import 'package:democracy/notification/models/preferences.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:responsive_framework/responsive_framework.dart';

@RoutePage()
class PreferencesPage extends StatefulWidget {
  const PreferencesPage({super.key});

  @override
  State<PreferencesPage> createState() => _PreferencesPageState();
}

class _PreferencesPageState extends State<PreferencesPage> {
  final ScrollController _scrollController = ScrollController();

  // Push notification state
  bool _isPushNotificationEnabled = false;
  bool _isCheckingPermission = false;

  @override
  void initState() {
    super.initState();
    context.read<PreferencesBloc>().add(const PreferencesEvent.get());
    _checkPushNotificationStatus();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        ActiveScrollController.activate(_scrollController);
      }
    });
  }

  @override
  void dispose() {
    ActiveScrollController.deactivate(_scrollController);
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _checkPushNotificationStatus() async {
    setState(() => _isCheckingPermission = true);
    try {
      final settings = await FirebaseMessaging.instance
          .getNotificationSettings();
      final isGranted =
          settings.authorizationStatus == AuthorizationStatus.authorized ||
          settings.authorizationStatus == AuthorizationStatus.provisional;

      if (mounted) {
        setState(() {
          _isPushNotificationEnabled = isGranted;
          _isCheckingPermission = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() => _isCheckingPermission = false);
      }
    }
  }

  Future<void> _handlePushNotificationToggle(bool value) async {
    if (value == _isPushNotificationEnabled) return;

    setState(() => _isCheckingPermission = true);

    try {
      if (value) {
        // USER WANTS TO ENABLE: Request OS permission
        final settings = await FirebaseMessaging.instance.requestPermission(
          alert: true,
          badge: true,
          sound: true,
        );

        final isGranted =
            settings.authorizationStatus == AuthorizationStatus.authorized ||
            settings.authorizationStatus == AuthorizationStatus.provisional;

        if (mounted) {
          setState(() {
            _isPushNotificationEnabled = isGranted;
            _isCheckingPermission = false;
          });

          if (!isGranted) {
            if (kIsWeb) {
              _showWebInstructions(isEnabling: true);
            } else {
              _showPermissionDeniedDialog();
            }
          }
        }
      } else {
        // Guide the user to their device settings to do it.
        if (mounted) {
          setState(() => _isCheckingPermission = false);
        }

        if (kIsWeb) {
          _showWebInstructions(isEnabling: !_isPushNotificationEnabled);
        } else {
          final opened = await openAppSettings();
          if (!opened && mounted) {
            _showPermissionDeniedDialog(); // Fallback if opening settings fails
          } else {
            // Re-check the status after the user returns from settings
            await _checkPushNotificationStatus();
          }
        }
      }
    } catch (e) {
      if (mounted) {
        setState(() => _isCheckingPermission = false);
      }
    }
  }

  void _showPermissionDeniedDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        constraints: const BoxConstraints(maxWidth: 600, maxHeight: 800),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        title: const Text('Notification Permission Required'),
        content: const Text(
          'To receive push notifications, please enable them in your device settings.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              openAppSettings();
            },
            child: const Text('Open Settings'),
          ),
        ],
      ),
    );
  }

  void _showWebInstructions({required bool isEnabling}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        constraints: const BoxConstraints(maxWidth: 600, maxHeight: 800),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        title: Text('${isEnabling ? 'Enable' : 'Disable'} Notifications'),
        content: Text(
          "To ${isEnabling ? 'enable' : 'disable'} web notifications, please click the lock/info icon in your browser's address bar and change the notification permissions.",
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _updatePreferences({
    bool? allowNotifications,
    bool? allowTagNotifications,
    bool? allowLikeNotifications,
    bool? allowReplyNotifications,
    bool? allowRepostNotifications,
    bool? allowMessageNotifications,
    MessagingPreference? messagingPreference,
    bool? allowFollowNotifications,
    bool? allowPetitionNotifications,
    bool? allowPetitionSupporterNotifications,
  }) {
    final currentPrefs = context.read<PreferencesBloc>().state.preferences;
    if (currentPrefs == null) return;

    context.read<PreferencesBloc>().add(
      PreferencesEvent.update(
        allowNotifications:
            allowNotifications ?? currentPrefs.allowNotifications,
        allowTagNotifications:
            allowTagNotifications ?? currentPrefs.allowTagNotifications,
        allowLikeNotifications:
            allowLikeNotifications ?? currentPrefs.allowLikeNotifications,
        allowReplyNotifications:
            allowReplyNotifications ?? currentPrefs.allowReplyNotifications,
        allowRepostNotifications:
            allowRepostNotifications ?? currentPrefs.allowRepostNotifications,
        allowMessageNotifications:
            allowMessageNotifications ?? currentPrefs.allowMessageNotifications,
        messagingPreference:
            messagingPreference ?? currentPrefs.messagingPreference,
        allowFollowNotifications:
            allowFollowNotifications ?? currentPrefs.allowFollowNotifications,
        allowPetitionNotifications:
            allowPetitionNotifications ??
            currentPrefs.allowPetitionNotifications,
        allowPetitionSupporterNotifications:
            allowPetitionSupporterNotifications ??
            currentPrefs.allowPetitionSupporterNotifications,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveBreakpoints.of(context);
    final isWebLayout = kIsWeb && responsive.largerThan(MOBILE);

    return MainContainer(
      child: Scaffold(
        appBar: AppBar(title: const Text('Preferences')),
        body: BlocBuilder<PreferencesBloc, PreferencesState>(
          builder: (context, state) {
            final preferences = state.preferences;

            if (preferences == null) {
              return const BottomLoader();
            }

            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: SingleChildScrollView(
                controller: isWebLayout ? _scrollController : null,
                physics: isWebLayout
                    ? const NeverScrollableScrollPhysics()
                    : null,
                padding: const EdgeInsets.only(top: 10, bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            'Notifications',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                        Switch(
                          value: preferences.allowNotifications,
                          onChanged: (value) {
                            _updatePreferences(allowNotifications: value);
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
                      child: preferences.allowNotifications
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Allow background notifications',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          const SizedBox(height: 2),
                                          Text(
                                            _isPushNotificationEnabled
                                                ? 'Notifications are enabled'
                                                : 'Notifications are disabled',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall
                                                ?.copyWith(
                                                  color: Colors.grey[600],
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    if (_isCheckingPermission)
                                      const SizedBox(
                                        width: 24,
                                        height: 24,
                                        child: Padding(
                                          padding: EdgeInsets.all(4),
                                          child: CircularProgressIndicator(
                                            strokeWidth: 2,
                                          ),
                                        ),
                                      )
                                    else
                                      Switch(
                                        value: _isPushNotificationEnabled,
                                        onChanged:
                                            _handlePushNotificationToggle,
                                      ),
                                  ],
                                ),
                                const SizedBox(height: 20),
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
                                  onChanged: (value) => _updatePreferences(
                                    allowTagNotifications: value,
                                  ),
                                ),
                                SwitchRow(
                                  text: 'Likes',
                                  value: preferences.allowLikeNotifications,
                                  onChanged: (value) => _updatePreferences(
                                    allowLikeNotifications: value,
                                  ),
                                ),
                                SwitchRow(
                                  text: 'Replies',
                                  value: preferences.allowReplyNotifications,
                                  onChanged: (value) => _updatePreferences(
                                    allowReplyNotifications: value,
                                  ),
                                ),
                                SwitchRow(
                                  text: 'Reposts',
                                  value: preferences.allowRepostNotifications,
                                  onChanged: (value) => _updatePreferences(
                                    allowRepostNotifications: value,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  'Messages',
                                  style: Theme.of(
                                    context,
                                  ).textTheme.titleMedium,
                                ),
                                SwitchRow(
                                  text: 'Receive notifications on new messages',
                                  value: preferences.allowMessageNotifications,
                                  onChanged: (value) => _updatePreferences(
                                    allowMessageNotifications: value,
                                  ),
                                ),
                                const SizedBox(height: 15),
                                Text(
                                  'Who can message you',
                                  style: Theme.of(context).textTheme.titleMedium
                                      ?.copyWith(fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(height: 8),
                                RadioGroup<MessagingPreference>(
                                  groupValue: preferences.messagingPreference,
                                  onChanged: (MessagingPreference? value) {
                                    if (value != null) {
                                      _updatePreferences(
                                        messagingPreference: value,
                                      );
                                    }
                                  },
                                  child: Column(
                                    children: [
                                      ListTile(
                                        title: Text(
                                          'Only people you follow',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall
                                              ?.copyWith(
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                        subtitle: Text(
                                          'This includes people you follow and people you\'ve messaged before.',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.copyWith(
                                                color: Colors.grey[600],
                                              ),
                                        ),
                                        trailing:
                                            const Radio<MessagingPreference>(
                                              value:
                                                  MessagingPreference.following,
                                            ),
                                        onTap: () => _updatePreferences(
                                          messagingPreference:
                                              MessagingPreference.following,
                                        ),
                                      ),
                                      ListTile(
                                        title: Text(
                                          'Anyone',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall
                                              ?.copyWith(
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                        subtitle: Text(
                                          'You may get message requests from people you don\'t follow. You can choose requests to accept into your inbox.',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.copyWith(
                                                color: Colors.grey[600],
                                              ),
                                        ),
                                        trailing:
                                            const Radio<MessagingPreference>(
                                              value: MessagingPreference.anyone,
                                            ),
                                        onTap: () => _updatePreferences(
                                          messagingPreference:
                                              MessagingPreference.anyone,
                                        ),
                                      ),
                                    ],
                                  ),
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
                                  onChanged: (value) => _updatePreferences(
                                    allowFollowNotifications: value,
                                  ),
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
                                  value: preferences.allowPetitionNotifications,
                                  onChanged: (value) => _updatePreferences(
                                    allowPetitionNotifications: value,
                                  ),
                                ),
                                SwitchRow(
                                  text: 'Supporters (of your petitions)',
                                  value: preferences
                                      .allowPetitionSupporterNotifications,
                                  onChanged: (value) => _updatePreferences(
                                    allowPetitionSupporterNotifications: value,
                                  ),
                                ),
                              ],
                            )
                          : const SizedBox.shrink(),
                    ),
                  ],
                ),
              ),
            );
          },
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
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: Text(text)),
        Switch(value: value, onChanged: onChanged),
      ],
    );
  }
}
