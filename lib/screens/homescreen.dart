import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_ksubway/components/AppTitle.dart';
import 'package:flutter_ksubway/components/SubwayInfo.dart';
import 'package:flutter_ksubway/components/SubwayLineButton.dart';
import 'package:flutter_ksubway/main.dart';
import 'package:flutter_ksubway/models/subwaydata.dart';
import 'package:flutter_ksubway/services/ThemePreference.dart';
import 'package:flutter_ksubway/services/subwayApi.dart';
import 'package:flutter_ksubway/style/subwayStyles.dart';
import 'package:flutter_ksubway/style/textStyles.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final themePreference = ThemePreference();
  final List<String> lineNumCd = <String>['1', '2', '3', '4', '5', '6', '7', '8', '9', 'SU', 'K', 'KK', 'G'];
  final List<String> lineNumTitles = <String>['1 호선', '2 호선', '3 호선', '4 호선', '5 호선', '6 호선', '7 호선', '8 호선', '9 호선', '분당선', '경의중앙선', '경강선', '경춘선'];

  late List<AnimationController> animationControllerList = [];
  final subwayInfoScrollController = ScrollController();
  final subwayLineScrollController = ScrollController();
  int lineNumPageIndex = 0;
  SubwayApi subwayApi = SubwayApi();
  Subwaydata subwaydata = Subwaydata();
  List<TtcVOList> ttcVOList = [];
  void updateTheme() async {
    bool isDarkTheme = await themePreference.getTheme();
    MyApp.themeNotifier.value = isDarkTheme == true ? ThemeMode.dark : ThemeMode.light;
    setState(() {});
  }

  void fetchAll() async {
    subwaydata = await subwayApi.fetchSubwaydata("1");
    ttcVOList = subwaydata.ttcVOList ?? [];
    ttcVOList.sort(((a, b) => a.trainY!.compareTo(b.trainY!)));
    setState(() {});
  }

  void updateSubwaydata(String lineNumCd) async {
    subwaydata = await subwayApi.fetchSubwaydata(lineNumCd);
    ttcVOList = subwaydata.ttcVOList ?? [];
    ttcVOList.sort(((a, b) => a.trainY!.compareTo(b.trainY!)));
    setState(() {});
  }

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (var i = 0; i < lineNumCd.length; i++) {
      final _animationController = AnimationController(duration: const Duration(milliseconds: 250), lowerBound: 0.0, upperBound: .45, vsync: this);
      _animationController.addListener(() {
        setState(() {});
      });
      animationControllerList.add(_animationController);
    }
    updateTheme();
    fetchAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      _launchInBrowser(Uri(
                        scheme: 'https',
                        host: 'github.com',
                        path: '/dart-bird/flutter_ksubway',
                      ));
                    },
                    icon: const FaIcon(FontAwesomeIcons.github),
                  ),
                  const AppTitle(title: 'K - SUBWAY Fighter'),
                  IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () async {
                      setState(() {});
                      themePreference.setDarkTheme(MyApp.themeNotifier.value == ThemeMode.light);
                      MyApp.themeNotifier.value = MyApp.themeNotifier.value == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
                    },
                    icon: Icon(MyApp.themeNotifier.value == ThemeMode.light ? Icons.dark_mode : Icons.light_mode),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),
            // -- content
            Expanded(
              child: Row(
                children: [
                  SizedBox(
                    width: 100,
                    child: ListView.builder(
                      controller: subwayLineScrollController,
                      itemCount: lineNumCd.length,
                      itemBuilder: (BuildContext context, int index) {
                        void _onTapDown(TapDownDetails details) {
                          animationControllerList[index].forward();
                        }

                        void _onTapUp(TapUpDetails details) {
                          animationControllerList[index].reverse();
                        }

                        return GestureDetector(
                          onTap: () {
                            lineNumPageIndex = index;
                            updateSubwaydata(lineNumCd[index]);
                          },
                          onTapDown: _onTapDown,
                          onTapUp: _onTapUp,
                          child: SubwayLineButton(
                            animationControllerList: animationControllerList,
                            lineNumTitles: lineNumTitles,
                            lineNumColors: lineNumColors,
                            index: index,
                          ),
                        );
                      },
                    ),
                  ),
                  SubwayInfo(
                    subwayInfoScrollController: subwayInfoScrollController,
                    ttcVOList: ttcVOList,
                    lineNumColors: lineNumColors,
                    lineNumPageIndex: lineNumPageIndex,
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Divider(thickness: 0.2, color: Colors.grey),
            ),
            SizedBox(
              height: 50,
              child: Column(
                children: [
                  const Text(
                    'Created by dart-bird',
                    style: textStyleFooter,
                  ),
                  OutlinedButton(
                    onPressed: () {
                      showLicensePage(context: context);
                    },
                    child: const Text("License", style: textStyleFooter),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
