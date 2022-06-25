import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData.dark().copyWith(
  iconTheme: const IconThemeData(color: Colors.white),
  cupertinoOverrideTheme: const CupertinoThemeData(
    brightness: Brightness.dark,
    primaryColor: CupertinoColors.systemBlue,
    textTheme: CupertinoTextThemeData(),
    barBackgroundColor: CupertinoColors.systemBackground,
  ),
);
ThemeData lightTheme = ThemeData.light().copyWith(
  scaffoldBackgroundColor: Color.fromARGB(255, 243, 243, 243),
  iconTheme: const IconThemeData(color: Colors.black),
  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(
      color: Colors.black87,
    ),
    backgroundColor: Colors.white,
    titleTextStyle: TextStyle(color: Colors.black87),
  ),
);
