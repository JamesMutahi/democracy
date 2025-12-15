import 'package:democracy/app/bloc/theme/theme_cubit.dart';
import 'package:democracy/notification/view/preferences.dart';
import 'package:democracy/user/view/widgets/muted_and_blocked.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/symbols.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: ListView(
        children: [
          ThemeModeListTile(),
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
                MaterialPageRoute(
                  builder: (context) => const PreferencesPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class ThemeModeListTile extends StatelessWidget {
  const ThemeModeListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        List<bool> isSelected = [false, false, false];
        ThemeMode themeMode = ThemeMode.system;
        if (state.index != null) {
          themeMode = ThemeMode.values[state.index!];
        }
        switch (themeMode) {
          case ThemeMode.light:
            isSelected = [true, false, false];
            break;
          case ThemeMode.system:
            isSelected = [false, true, false];
            break;
          case ThemeMode.dark:
            isSelected = [false, false, true];
            break;
        }
        return ListTile(
          leading: const Icon(Symbols.settings_brightness_rounded),
          title: const Text('Theme'),
          onTap: () {
            switch (themeMode) {
              case ThemeMode.light:
                context.read<ThemeCubit>().change(
                  index: ThemeMode.system.index,
                );
                break;
              case ThemeMode.system:
                context.read<ThemeCubit>().change(index: ThemeMode.dark.index);
                break;
              case ThemeMode.dark:
                context.read<ThemeCubit>().change(index: ThemeMode.light.index);
                break;
            }
          },
          trailing: ThemeModeToggleButtons(isSelected: isSelected),
        );
      },
    );
  }
}

@immutable
class ThemeModeToggleButtons extends StatelessWidget {
  const ThemeModeToggleButtons({super.key, required this.isSelected});

  final List<bool> isSelected;

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      isSelected: isSelected,
      onPressed: (int newIndex) {
        if (newIndex == 0) {
          context.read<ThemeCubit>().change(index: ThemeMode.light.index);
        } else if (newIndex == 1) {
          context.read<ThemeCubit>().change(index: ThemeMode.system.index);
        } else {
          context.read<ThemeCubit>().change(index: ThemeMode.dark.index);
        }
      },
      children: const <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 9.5),
          child: Icon(Icons.wb_sunny),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 9.5),
          child: Icon(Icons.phone_iphone),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 9.5),
          child: Icon(Icons.bedtime),
        ),
      ],
    );
  }
}
