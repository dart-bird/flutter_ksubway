import 'package:flutter/material.dart';
import 'package:flutter_ksubway/screens/homescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.light);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (_, ThemeMode currentMode, __) {
        return MaterialApp(
          title: 'K-SUBWAY',
          darkTheme: ThemeData.dark(),
          themeMode: currentMode,
          home: const HomeScreen(),
        );
      },
    );
  }
}
