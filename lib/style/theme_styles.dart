import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData.dark().copyWith(
  cupertinoOverrideTheme: const CupertinoThemeData(
    brightness: Brightness.dark,
    primaryColor: CupertinoColors.systemBlue,
    textTheme: CupertinoTextThemeData(),
    barBackgroundColor: CupertinoColors.systemBackground,
  ),
);
ThemeData lightTheme = ThemeData.light().copyWith(
  backgroundColor: Colors.white60,
  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(
      color: Colors.black87,
    ),
    backgroundColor: Colors.white,
    titleTextStyle: TextStyle(color: Colors.black87),
  ),
);
