import 'package:flutter/material.dart';
import 'package:flutter_ksubway/models/exp_ksubway_info.dart';
import 'package:flutter_ksubway/preferences/exp_api_preference.dart';
import 'package:flutter_ksubway/services/exp_ksubway_api.dart';

class ExpKsubwayProvider extends ChangeNotifier {
  final List<String> lineNumCdList = <String>['1', '2', '3', '4', '5', '6', '7', '8', '9', 'SU', 'K', 'KK', 'G'];
  final List<String> lineNumTitles = <String>['1 호선', '2 호선', '3 호선', '4 호선', '5 호선', '6 호선', '7 호선', '8 호선', '9 호선', '분당선', '경의중앙선', '경강선', '경춘선'];

  int lineNumPageIndex = 0;
  ExpksubwayApi expksubwayApi = ExpksubwayApi();
  ExpksubwayInfo expksubwayInfo = ExpksubwayInfo();
  List<TtcVOList> ttcVOList = [];

  final _expApiPreference = ExpApiPreference();
  String _expksubwayApiUrl = 'demo';
  bool _isPlayDemo = true;

  bool get isPlayDemo => _isPlayDemo;
  String get expksubwayApiUrl => _expksubwayApiUrl;

  set expksubwayApiUrl(String value) {
    _expksubwayApiUrl = value;
    notifyListeners();
  }

  void saveExpksubwayApiEndpoint() {
    _expApiPreference.setApiEndpoint(_expksubwayApiUrl);
  }

  void updateExpksubwayInfo(String lineNumCd) async {
    expksubwayInfo = await expksubwayApi.fetchExpksubwayInfo(lineNumCd, _expksubwayApiUrl);
    if (expksubwayInfo.isDemo != null && expksubwayInfo.isDemo == true) {
      expksubwayInfo = await expksubwayApi.fetchDemoExpksubwayInfo(lineNumCd);
      _isPlayDemo = true;
    } else {
      _isPlayDemo = false;
    }
    ttcVOList = expksubwayInfo.ttcVOList ?? [];
    ttcVOList.sort(((a, b) => a.trainY!.compareTo(b.trainY!)));
    notifyListeners();
  }

  void updateLineNumPageIndex(int index) {
    lineNumPageIndex = index;
    notifyListeners();
  }

  void init() async {
    _expksubwayApiUrl = await _expApiPreference.getApiEndpoint();
    notifyListeners();
  }
}
