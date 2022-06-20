import 'dart:convert';

import 'package:flutter_ksubway/models/ksubway_seoulstations.dart';
import 'package:shared_preferences/shared_preferences.dart';

class KsubwayStationsPreference {
  static const seoulStations = "seoul_stations";

  setSeoulstations(KsubwaySeoulstations value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(seoulStations, value.toJson().toString());
  }

  Future<KsubwaySeoulstations> getSeoulstations() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return KsubwaySeoulstations.fromJson(
      json.decode(
        prefs.getString(seoulStations) ?? '{"stationList":[]}',
      ),
    );
  }
}
