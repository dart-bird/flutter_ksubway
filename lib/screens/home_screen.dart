import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ksubway/config/application.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            IconButton(
              onPressed: () {
                Application.router.navigateTo(
                  context,
                  "/arrinfo/서울",
                  transition: TransitionType.materialFullScreenDialog,
                );
              },
              icon: const FaIcon(FontAwesomeIcons.magnifyingGlass),
            ),
            CupertinoButton(
              child: Text('Experiment Ksubway'),
              onPressed: () {
                Application.router.navigateTo(context, "/exp", transition: TransitionType.cupertino);
              },
            ),
            CupertinoButton(
              child: Text('Setting'),
              onPressed: () {
                Application.router.navigateTo(context, "/setting", transition: TransitionType.cupertino);
              },
            ),
          ],
        ),
      ),
    );
  }
}
