import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:flutter_ksubway/models/exp_ksubway_info.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ExpksubwayApi {
  Future<ExpksubwayInfo> fetchExpksubwayInfo(String lineNumCd, String url) async {
    String proxyUri = const String.fromEnvironment("proxy");

    if (url == "demo") {
      return ExpksubwayInfo(isDemo: true);
    }
    final response = await http.post(
      Uri.parse("$proxyUri$url?lineNumCd=$lineNumCd"),
    );
    if (response.statusCode == 200) {
      return ExpksubwayInfo.fromJson(json.decode(response.body));
    } else {
      log('Failed to load subway data');
      return ExpksubwayInfo();
    }
  }

  Future<ExpksubwayInfo> fetchDemoExpksubwayInfo(String lineNumCd) async {
    String data = await rootBundle.loadString('data/exp_ksubway_api/demo.json');
    return ExpksubwayInfo.fromJson(json.decode(data)[lineNumCd]);
  }
}
