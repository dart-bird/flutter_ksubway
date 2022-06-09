import 'package:flutter/material.dart';
import 'package:flutter_ksubway/main.dart';
import 'package:flutter_ksubway/models/subwaydata.dart';
import 'package:flutter_ksubway/style/textStyles.dart';
import 'package:marquee/marquee.dart';

class SubwayInfo extends StatelessWidget {
  const SubwayInfo({
    Key? key,
    required this.subwayInfoScrollController,
    required this.ttcVOList,
    required this.lineNumColors,
    required this.lineNumPageIndex,
  }) : super(key: key);

  final ScrollController subwayInfoScrollController;
  final List<TtcVOList> ttcVOList;
  final List<Color> lineNumColors;
  final int lineNumPageIndex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AnimatedContainer(
        margin: const EdgeInsets.fromLTRB(8, 0, 8, 12),
        // 지하철 정보 뜨는 곳
        child: ttcVOList.isEmpty
            ? const Center(
                child: Text(
                  '정보를 불러오지 못했어요',
                  style: textStyleSub1,
                ),
              )
            : ListView.builder(
                controller: subwayInfoScrollController,
                itemCount: ttcVOList.length,
                itemBuilder: ((context, index) {
                  String subwayNum = "";
                  String carNum = "";
                  String direction = "";
                  String status = "";
                  String currStation = "";
                  Color statusColor = Colors.white;
                  subwayNum = ttcVOList[index].trainY! == "null" ? "정보없음" : ttcVOList[index].trainY!;
                  carNum = ttcVOList[index].trainP! == "null" ? "정보없음" : ttcVOList[index].trainP!;
                  subwayNum = ttcVOList[index].trainY! == "null" ? "정보없음" : ttcVOList[index].trainY!;
                  direction = ttcVOList[index].statnTnm! == "null" ? "정보없음" : ttcVOList[index].statnTnm!.replaceAll("(", "\n(") + "행";
                  status = ttcVOList[index].sts! == "null" ? "-" : ttcVOList[index].sts!;
                  currStation = ttcVOList[index].stationNm! == "null" ? "-" : ttcVOList[index].stationNm!;
                  if (status == "1") {
                    statusColor = Colors.green;
                    status = "접근";
                  }
                  if (status == "2") {
                    statusColor = Colors.cyan;
                    status = "도착";
                  }
                  if (status == "3") {
                    statusColor = MyApp.themeNotifier.value == ThemeMode.light ? Colors.yellow : const Color.fromARGB(255, 153, 141, 34);
                    status = "출발";
                  }

                  if (status == "4") {
                    statusColor = Colors.red;
                    status = "통과";
                  }
                  return AnimatedContainer(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    margin: ttcVOList.length - 1 != index ? const EdgeInsets.fromLTRB(16, 16, 16, 0) : const EdgeInsets.fromLTRB(16, 16, 16, 16),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Container(
                              width: 90, // 장평이 안맞아서 가로 길이 고정
                              child: Center(
                                child: Text(
                                  subwayNum,
                                  style: textStyleSub1,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              color: lineNumColors[lineNumPageIndex],
                            ),
                            Container(
                              width: 90, // 장평이 안맞아서 가로 길이 고정
                              child: Center(
                                child: Text(
                                  direction,
                                  style: textStyleSub1,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              color: lineNumColors[lineNumPageIndex].withAlpha(100),
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
                                "CAR # $carNum",
                                style: textStyleSub1,
                              ),
                              SizedBox(
                                height: 20,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        child: Center(
                                          child: currStation.length > 4
                                              ? Marquee(
                                                  text: currStation,
                                                  style: textStyleSub1,
                                                  blankSpace: 25,
                                                  velocity: 25,
                                                )
                                              : Text(
                                                  currStation,
                                                  style: textStyleSub1,
                                                ),
                                        ),
                                        color: lineNumColors[lineNumPageIndex].withAlpha(100),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        child: Center(
                                          child: Text(
                                            status,
                                            style: textStyleSub1,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        color: statusColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    duration: const Duration(milliseconds: 220),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      color: MyApp.themeNotifier.value == ThemeMode.light ? Colors.white : Color.fromARGB(255, 52, 86, 97),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 32, 32, 32),
                          offset: const Offset(5.0, 4.0),
                          blurRadius: 12.0,
                        ),
                      ],
                    ),
                  );
                }),
              ),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          color: lineNumColors[lineNumPageIndex],
          boxShadow: [
            BoxShadow(
              color: MyApp.themeNotifier.value == ThemeMode.light ? Colors.grey : Color.fromARGB(255, 34, 34, 34),
              offset: const Offset(5.0, 8.0),
              blurRadius: 24.0,
            ),
          ],
        ),
        duration: const Duration(milliseconds: 220),
      ),
    );
  }
}
