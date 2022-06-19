import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ksubway/config/handler.dart';
import 'package:flutter_ksubway/screens/notfound_screen.dart';

class Routes {
  static String root = "/";
  static String expScreen = "/exp";
  static String settingScreen = "/setting";
  static String arrinfoScreen = "/arrinfo/:stationName";
  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = Handler(handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      return const NotFoundScreen();
    });
    router.define(root, handler: rootHandler);
    router.define(expScreen, handler: expScreenHandler);
    router.define(settingScreen, handler: settingScreenHandler);
    router.define(arrinfoScreen, handler: arrinfoScreenHandler);
  }
}
