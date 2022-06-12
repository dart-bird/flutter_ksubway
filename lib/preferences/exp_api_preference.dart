import 'package:shared_preferences/shared_preferences.dart';

class ExpApiPreference {
  static const expApiEndpoint = "exp_api_endpoint";

  setApiEndpoint(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(expApiEndpoint, value);
  }

  Future<String> getApiEndpoint() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(expApiEndpoint) ?? "demo";
  }
}
