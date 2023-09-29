import 'package:shared_preferences/shared_preferences.dart';

class Shared {
  static late SharedPreferences sharedPreferences;
  static Future init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future setstring(String key, String value) async {
    sharedPreferences.setString(key, value).then((value) {}).catchError((e) {
      print(e.toString());
    });
  }

  static Future setBool(String key, bool value) async {
    sharedPreferences.setBool(key, value).then((value) {}).catchError((e) {
      print(e.toString());
    });
  }

  static bool? getBool(String value) {
    return sharedPreferences.getBool(value);
  }

  static Future setInt(String key, int value) async {
    sharedPreferences.setInt(key, value).then((value) {}).catchError((e) {
      print(e.toString());
    });
  }

  static int? getInt(String value) {
    return sharedPreferences.getInt(value);
  }

  static String? getstring(String value) {
    return sharedPreferences.getString(value);
  }

  static Future deleteString(String value) {
    return sharedPreferences.remove("token");
  }

  static Future clear() async {
    await sharedPreferences.clear().then((value) {
      print("all cleared");
    });
  }
}
