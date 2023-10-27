import 'package:flutter/material.dart';
import 'package:tz_ithub/src/screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:tz_ithub/src/utils/theme.dart';

void main() {
  runApp(
    ChangeNotifierProvider<ThemeChanger>(
      create: (_) => ThemeChanger(
          Themes.lightTheme),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context).getTheme();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Currency App',
      theme: theme,
      home: const HomeScreen(),
    );
  }
}
