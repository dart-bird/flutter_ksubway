import 'package:flutter/services.dart';
import 'package:flutter_ksubway/models/exp_ksubway_info.dart';
import 'package:flutter_ksubway/preferences/exp_api_preference.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ExpksubwayApi {
  Future<ExpksubwayInfo> fetchExpksubwayInfo(String lineNumCd) async {
    final expApiPreference = ExpApiPreference();
    String _uri = await expApiPreference.getApiEndpoint();
    if (_uri == "demo") {
      String data = await rootBundle.loadString('data/exp_ksubway_api/demo.json');
      return ExpksubwayInfo.fromJson(json.decode(data)[lineNumCd]);
    }
    final response = await http.post(
      Uri.parse(_uri + "?lineNumCd=" + lineNumCd),
    );
    if (response.statusCode == 200) {
      return ExpksubwayInfo.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load subway data');
    }
  }
}
