import 'dart:developer';
import 'package:flutter_ksubway/models/ksubway_arrinfo.dart';
import 'package:flutter_ksubway/models/ksubway_seoulstations.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class KsubwayApi {
  static Future<KsubwayArrinfo> fetchKsubwayArrinfo({required String startPage, required String endPage, required String realtimeType, required String stationName}) async {
    String _serviceKey = const String.fromEnvironment("swopenapi_seoul_subway_key");
    String _proxyUri = const String.fromEnvironment("proxy");
    String _apiEndpoint = "";
    if (_serviceKey.isEmpty || _serviceKey == 'demo' || _serviceKey == "sample") {
      _apiEndpoint = _proxyUri + 'http://swopenapi.seoul.go.kr/api/subway/sample/json/$realtimeType/0/5/$stationName';
    } else {
      _apiEndpoint = _proxyUri + 'http://swopenapi.seoul.go.kr/api/subway/$_serviceKey/json/$realtimeType/$startPage/$endPage/$stationName';
    }

    final response = await http.get(
      Uri.parse(_apiEndpoint),
    );

    if (response.statusCode == 200) {
      KsubwayArrinfo _result = KsubwayArrinfo.fromJson(json.decode(response.body));
      if (json.decode(response.body)["code"] == "ERROR-337") {
        log('Exceed request API Key (replaced by sample key)');
        final _response = await http.get(
          Uri.parse(_apiEndpoint),
        );
        _result = KsubwayArrinfo.fromJson(json.decode(_response.body));
      }
      return _result;
    } else {
      throw Exception('Failed to load subway data');
    }
  }

  static Future<dynamic> fetchKsubwayStations({required String city}) async {
    final response = await http.get(
      Uri.parse('https://raw.githubusercontent.com/dart-bird/korea-subway-stations/main/${city}_stations.json'),
    );
    if (response.statusCode == 200) {
      final result = KsubwaySeoulstations.fromJson(json.decode(response.body));
      return result;
    } else {
      throw Exception('Failed to load subway station data');
    }
  }
}
