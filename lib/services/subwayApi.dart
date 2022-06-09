import 'package:flutter/services.dart';
import 'package:flutter_ksubway/models/subwaydata.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SubwayApi {
  Future<Subwaydata> fetchSubwaydata(String lineNumCd) async {
    String _uri = const String.fromEnvironment('ksubwayAPI');
    if (_uri.isEmpty) {
      String data = await rootBundle.loadString('data/ksubwayApi/demo.json');
      return Subwaydata.fromJson(json.decode(data)[lineNumCd]);
    }
    final response = await http.post(
      Uri.parse(_uri + "?lineNumCd=" + lineNumCd),
      headers: {"Accept": "application/json", "Access-Control_Allow_Origin": "*"},
    );
    if (response.statusCode == 200) {
      return Subwaydata.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load subway data');
    }
  }
}
