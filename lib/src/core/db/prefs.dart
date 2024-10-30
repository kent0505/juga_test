import 'package:shared_preferences/shared_preferences.dart';

import '../utils.dart';

int lastLoadDay = 1;
String jsonData = '';

Future<bool> getData() async {
  try {
    final prefs = await SharedPreferences.getInstance();
    // await prefs.remove('onboard');
    // await prefs.clear();
    bool onboard = prefs.getBool('onboard') ?? true;
    lastLoadDay = prefs.getInt('lastLoadDay') ?? 1;
    jsonData = prefs.getString('jsonData') ?? '';
    return onboard;
  } catch (e) {
    logger(e);
    return true;
  }
}

Future<void> saveOnboard() async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setBool('onboard', false);
}

// Future<void> saveString(String key, String value) async {
//   final prefs = await SharedPreferences.getInstance();
//   prefs.setString(key, value);
// }

// Future<void> saveInt(String key, int value) async {
//   final prefs = await SharedPreferences.getInstance();
//   prefs.setInt(key, value);
// }

// Future<void> saveBool(String key, bool value) async {
//   final prefs = await SharedPreferences.getInstance();
//   prefs.setBool(key, value);
// }

Future<void> saveLoad(int day, String json) async {
  final prefs = await SharedPreferences.getInstance();
  lastLoadDay = day;
  jsonData = json;
  prefs.setInt('lastLoadDay', day);
  prefs.setString('jsonData', json);
  logger('lastLoadDay = $day');
}
