import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ksubway/screens/exp_screen.dart';
import 'package:flutter_ksubway/screens/home_screen.dart';
import 'package:flutter_ksubway/screens/setting_screen.dart';

var rootHandler = Handler(handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const HomeScreen();
});
var expScreenHandler = Handler(handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const ExpScreen();
});
var settingScreenHandler = Handler(handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const SettingScreen();
});
