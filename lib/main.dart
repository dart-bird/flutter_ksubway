import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ksubway/config/routes.dart';
import 'package:flutter_ksubway/preferences/theme_preference.dart';
import 'package:flutter_ksubway/style/theme_styles.dart';
import 'package:url_strategy/url_strategy.dart';
import 'config/application.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final themePreference = ThemePreference();
  bool isDarkTheme = await themePreference.getTheme();
  MyApp.themeNotifier.value = isDarkTheme == true ? ThemeMode.dark : ThemeMode.light;
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  static final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.light);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  _MyAppState() {
    final router = FluroRouter();
    Routes.configureRoutes(router);
    Application.router = router;
  }
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: MyApp.themeNotifier,
      builder: (_, ThemeMode currentMode, __) {
        return MaterialApp(
          title: 'K-SUBWAY',
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: currentMode,
          onGenerateRoute: Application.router.generator,
        );
      },
    );
  }
}
