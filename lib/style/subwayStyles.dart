import 'package:flutter/material.dart';

final List<Color> lineNumColors = <Color>[
  const Color.fromARGB(255, 29, 93, 212), // 1 호선
  const Color(0xff3B9F37), // 2 호선
  const Color(0xffff8439), // 3 호선
  const Color(0xff4193f8), // 4 호선
  const Color(0xffb15ed9), // 5 호선
  const Color(0xffdc7732), // 6 호선
  const Color(0xff9bb556), // 7 호선
  const Color(0xffff2580), // 8 호선
  const Color(0xffebb700), // 9 호선
  const Color(0xff32c6a6), // 중앙선
  const Color(0xff05a59d), // 경의중앙선
  const Color(0xff84deff), // 공항철도
  const Color(0xff2d9b76), // 경춘선
  const Color(0xfffabf02), // 수인분당선
  const Color(0xffd5023d), // 신분당선
  const Color(0xffb2d01a), // 우이신설선
];

final Map<int, Color> lineIdColors = {
  1001: lineNumColors[0], // 1 호선
  1002: lineNumColors[1], // 2 호선
  1003: lineNumColors[2], // 3 호선
  1004: lineNumColors[3], // 4 호선
  1005: lineNumColors[4], // 5 호선
  1006: lineNumColors[5], // 6 호선
  1007: lineNumColors[6], // 7 호선
  1008: lineNumColors[7], // 8 호선
  1009: lineNumColors[8], // 9 호선
  1061: lineNumColors[9], // 중앙선
  1063: lineNumColors[10], // 경의중앙선
  1065: lineNumColors[11], // 공항철도
  1067: lineNumColors[12], // 경춘선
  1075: lineNumColors[13], // 수인분당선
  1077: lineNumColors[14], // 신분당선
  1092: lineNumColors[15], // 우이신설선
};

final Map<int, String> lineIdTexts = {
  1001: "1호선",
  1002: "2호선",
  1003: "3호선",
  1004: "4호선",
  1005: "5호선",
  1006: "6호선",
  1007: "7호선",
  1008: "8호선",
  1009: "9호선",
  1061: "중앙선",
  1063: "경의중앙선",
  1065: "공항철도",
  1067: "경춘선",
  1075: "수인분당선",
  1077: "신분당선",
  1092: "우이신설선",
};
