import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ksubway/components/app_title.dart';
import 'package:flutter_ksubway/components/subway_info.dart';
import 'package:flutter_ksubway/components/subway_line_button.dart';
import 'package:flutter_ksubway/models/exp_ksubway_info.dart';
import 'package:flutter_ksubway/services/exp_ksubway_api.dart';
import 'package:flutter_ksubway/style/subwayStyles.dart';

class ExpScreen extends StatefulWidget {
  const ExpScreen({Key? key}) : super(key: key);

  @override
  State<ExpScreen> createState() => _ExpScreenState();
}

class _ExpScreenState extends State<ExpScreen> with TickerProviderStateMixin {
  final List<String> lineNumCd = <String>['1', '2', '3', '4', '5', '6', '7', '8', '9', 'SU', 'K', 'KK', 'G'];
  final List<String> lineNumTitles = <String>['1 호선', '2 호선', '3 호선', '4 호선', '5 호선', '6 호선', '7 호선', '8 호선', '9 호선', '분당선', '경의중앙선', '경강선', '경춘선'];

  late List<AnimationController> animationControllerList = [];
  final subwayInfoScrollController = ScrollController();
  final subwayLineScrollController = ScrollController();
  int lineNumPageIndex = 0;
  ExpksubwayApi expksubwayApi = ExpksubwayApi();
  ExpksubwayInfo expksubwayInfo = ExpksubwayInfo();
  List<TtcVOList> ttcVOList = [];

  void fetchAll() async {
    expksubwayInfo = await expksubwayApi.fetchExpksubwayInfo("1");
    ttcVOList = expksubwayInfo.ttcVOList ?? [];
    ttcVOList.sort(((a, b) => a.trainY!.compareTo(b.trainY!)));
    setState(() {});
  }

  void updateExpksubwayInfo(String lineNumCd) async {
    expksubwayInfo = await expksubwayApi.fetchExpksubwayInfo(lineNumCd);
    ttcVOList = expksubwayInfo.ttcVOList ?? [];
    ttcVOList.sort(((a, b) => a.trainY!.compareTo(b.trainY!)));
    setState(() {});
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
    fetchAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const CupertinoNavigationBar(
              previousPageTitle: 'back',
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  AppTitle(title: 'K - SUBWAY Fighter'),
                ],
              ),
            ),
            const SizedBox(height: 8),
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
                            updateExpksubwayInfo(lineNumCd[index]);
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
          ],
        ),
      ),
    );
  }
}
