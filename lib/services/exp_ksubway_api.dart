import 'package:flutter/services.dart';
import 'package:flutter_ksubway/models/exp_ksubway_info.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ExpksubwayApi {
  Future<ExpksubwayInfo> fetchExpksubwayInfo(String lineNumCd) async {
    String _uri = const String.fromEnvironment('ksubwayAPI');
    if (_uri.isEmpty) {
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
