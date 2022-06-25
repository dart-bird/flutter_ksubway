import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_ksubway/main.dart';
import 'package:flutter_ksubway/models/ksubway_arrinfo.dart';
import 'package:flutter_ksubway/services/ksubway_api.dart';
import 'package:flutter_ksubway/style/textStyles.dart';

class ArrInfoScreen extends StatefulWidget {
  final String stationName;
  const ArrInfoScreen(this.stationName, {Key? key}) : super(key: key);

  @override
  State<ArrInfoScreen> createState() => _ArrInfoScreenState();
}

class _ArrInfoScreenState extends State<ArrInfoScreen> {
  Timer? timer;
  List<int> endTimes = [];
  KsubwayArrinfo _ksubwayArrinfo = KsubwayArrinfo();
  List<RealtimeArrivalList> realtimeArrivalList = [];
  List<int> createEndTimes(List<RealtimeArrivalList> realtimeArrivalList) {
    List<int> _result = [];
    for (var i = 0; i < realtimeArrivalList.length; i++) {
      DateTime _now = DateTime.now();
      DateTime _serverNow = DateTime.parse(realtimeArrivalList[i].recptnDt ?? _now.toString());
      int _gap = (_now.second - _serverNow.second).abs();
      int _endTime = _now.millisecondsSinceEpoch + Duration(seconds: int.parse(realtimeArrivalList[i].barvlDt ?? "0") - _gap).inMilliseconds;
      _result.add(_endTime);
    }
    return _result;
  }

  void fetchAll() async {
    _ksubwayArrinfo = await KsubwayApi.fetchKsubwayArrinfo(
      startPage: "0",
      endPage: "50",
      realtimeType: "realtimeStationArrival",
      stationName: widget.stationName,
    );
    realtimeArrivalList = _ksubwayArrinfo.realtimeArrivalList ?? [];
    endTimes = createEndTimes(realtimeArrivalList);

    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 15), (Timer t) => fetchAll());
    fetchAll();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.stationName, style: textStyleTitle),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 16),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: realtimeArrivalList.length,
                      itemBuilder: (context, index) {
                        return SubwayCard(realtimeArrivalList: realtimeArrivalList, endTimes: endTimes, widget: widget, index: index);
                      },
                    ),
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

class SubwayCard extends StatelessWidget {
  const SubwayCard({
    Key? key,
    required this.realtimeArrivalList,
    required this.endTimes,
    required this.widget,
    required this.index,
  }) : super(key: key);

  final List<RealtimeArrivalList> realtimeArrivalList;
  final List<int> endTimes;
  final ArrInfoScreen widget;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Center(
              child: Text(
                realtimeArrivalList[index].trainLineNm!.replaceAll(' (급행)', ''),
                style: textStyleSub1,
                textAlign: TextAlign.center,
              ),
            ),
            // color: Colors.white.withAlpha(100),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
              color: MyApp.themeNotifier.value == ThemeMode.light ? Colors.white : Color(0xff454545),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromARGB(255, 22, 22, 22),
                  offset: Offset(2.0, 2.0),
                  blurRadius: 4.0,
                ),
              ],
            ),
          ),
          AnimatedContainer(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              children: [
                Column(
                  children: [
                    Container(
                      width: 90, // 장평이 안맞아서 가로 길이 고정
                      child: Center(
                        child: Text(
                          realtimeArrivalList[index].subwayId!,
                          style: textStyleSub1,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      color: Color.fromARGB(255, 129, 112, 112),
                    ),
                    Container(
                      width: 90, // 장평이 안맞아서 가로 길이 고정
                      child: Center(
                        child: Text(
                          realtimeArrivalList[index].btrainSttus! == "null" ? "일반" : realtimeArrivalList[index].btrainSttus!,
                          style: textStyleSub1,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      color: Color.fromARGB(255, 94, 34, 34).withAlpha(100),
                    ),
                  ],
                ),
                Container(height: 50, width: 1, color: Colors.grey),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "종착역 : ${realtimeArrivalList[index].bstatnNm!.replaceAll(' (급행)', '')}",
                        style: textStyleSub1,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: CountdownTimer(
                    endTime: endTimes[index],
                    widgetBuilder: (_, CurrentRemainingTime? time) {
                      if (time == null) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: Text(
                            '${widget.stationName} ${parseArrCode(realtimeArrivalList[index].arvlCd!)}',
                            style: textStyleSub1.copyWith(color: Colors.redAccent),
                            textAlign: TextAlign.right,
                          ),
                        );
                      }
                      return Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '${widget.stationName} ${parseArrCode(realtimeArrivalList[index].arvlCd!)}',
                              style: textStyleSub1.copyWith(color: Colors.redAccent),
                              textAlign: TextAlign.right,
                            ),
                            Text(
                              parseTime(time.min, time.sec),
                              style: textStyleSub1.copyWith(color: Colors.redAccent),
                              textAlign: TextAlign.right,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            duration: const Duration(milliseconds: 220),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              color: MyApp.themeNotifier.value == ThemeMode.light ? Colors.white : Color(0xff454545),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromARGB(255, 22, 22, 22),
                  offset: Offset(2.0, 2.0),
                  blurRadius: 4.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

String parseTime(int? min, int? sec) {
  int _min = min ?? 0;
  int _sec = sec ?? 0;
  if (_min == 0) return "$_sec초";
  if (_min == 0 && _sec == 0) return "";
  return "$_min분 $_sec초";
}

String parseArrCode(String code) {
  switch (code) {
    case '0':
      return '진입';
    case '1':
      return '도착';
    case '2':
      return '출발';
    case '3':
      return '전역출발';
    case '4':
      return '전역진입';
    case '5':
      return '전역도착';
    case '99':
      return '도착 전';
    default:
      return code;
  }
}
