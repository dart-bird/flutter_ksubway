import 'package:flutter/material.dart';
import 'package:flutter_ksubway/models/ksubway_seoulstations.dart';
import 'package:flutter_ksubway/preferences/ksubway_stations_preference.dart';
import 'package:flutter_ksubway/services/ksubway_api.dart';
import 'package:fluttertoast/fluttertoast.dart';

class KsubwayProvider extends ChangeNotifier {
  final KsubwayStationsPreference _ksubwayStationsPreference = KsubwayStationsPreference();
  KsubwaySeoulstations _ksubwaySeoulstations = KsubwaySeoulstations(stationList: []);
  final List<StationList> _stationSuggestions = [];
  List<StationList> get stationSuggestions => _stationSuggestions;
  KsubwaySeoulstations get ksubwaySeoulstations => _ksubwaySeoulstations;

  void updateStationSuggestions(String value) {
    stationSuggestions.clear();
    for (var i = 0; i < _ksubwaySeoulstations.stationList!.length; i++) {
      String expValue = '';
      value.isEmpty ? expValue = '' : expValue = '?' + value;
      RegExp exp = RegExp(r'()' + expValue);
      if (exp.hasMatch(_ksubwaySeoulstations.stationList![i].statnNm!) && value.isEmpty == false) {
        stationSuggestions.add(_ksubwaySeoulstations.stationList![i]);
      }
    }
    notifyListeners();
  }

  Future<void> updateKsubwayStations() async {
    _ksubwaySeoulstations = await KsubwayApi.fetchKsubwayStations(city: 'seoul');
    _ksubwayStationsPreference.setSeoulstations(_ksubwaySeoulstations);
    Fluttertoast.showToast(msg: "서울 역정보 업데이트 완료", toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.CENTER, timeInSecForIosWeb: 1, backgroundColor: Colors.red, textColor: Colors.white, fontSize: 16.0);
    notifyListeners();
  }

  void init() async {
    await updateKsubwayStations();
  }
}
