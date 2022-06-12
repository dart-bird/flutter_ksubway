import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ksubway/config/application.dart';

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
            Text('Home Screen'),
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
