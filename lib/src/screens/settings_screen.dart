import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utils/theme.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChanger>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Настройки'),
      ),
      body: Column(
        children: [
          const ListTile(
            title: Text('Текущая версия: 1.0.0'),
          ),
          ElevatedButton(
            onPressed: () {
              themeChanger.setTheme(
                themeChanger.getTheme() == Themes.lightTheme
                    ? Themes.darkTheme
                    : Themes.lightTheme,
              );
            },
            child: const Text('Сменить тему'),
          ),
        ],
      ),
    );
  }
}
