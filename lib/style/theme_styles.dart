import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData.dark().copyWith(
    cupertinoOverrideTheme: const CupertinoThemeData(
  brightness: Brightness.dark,
  primaryColor: CupertinoColors.systemBlue,
  textTheme: CupertinoTextThemeData(),
  barBackgroundColor: CupertinoColors.systemBackground,
));
