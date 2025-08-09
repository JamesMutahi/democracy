import 'package:democracy/notification/view/preferences.dart';
import 'package:democracy/user/view/widgets/muted_and_blocked.dart';
import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.volume_mute),
            title: const Text('Mute and block'),
            subtitle: const Text("Manage accounts you've muted and blocked"),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const MutedAndBlocked(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.tune_rounded),
            title: const Text('Preferences'),
            subtitle: const Text("Manage your notification preferences"),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const PreferencesPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
