import 'package:shared_preferences/shared_preferences.dart';

class Shared {
  static  SharedPreferences? sharedPreferences;
  static Future init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future setstring(String key, String value) async { 
    sharedPreferences ??= await SharedPreferences.getInstance();
    sharedPreferences!.setString(key, value).then((value) {}).catchError((e) {
      print(e.toString());
    });
  }

  static Future setBool(String key, bool value) async {
    sharedPreferences ??= await SharedPreferences.getInstance();
    sharedPreferences!.setBool(key, value).then((value) {}).catchError((e) {
      print(e.toString());
    });
  }

  static bool? getBool(String value) {
    return sharedPreferences!.getBool(value);
  }

  static Future setInt(String key, int value) async {
    sharedPreferences ??= await SharedPreferences.getInstance();
    sharedPreferences!.setInt(key, value).then((value) {}).catchError((e) {
      print(e.toString());
    });
  }

  static int? getInt(String value) {
    return sharedPreferences!.getInt(value);
  }

  static Future setDouble(String key, double value) async {
     sharedPreferences ??= await SharedPreferences.getInstance();
    sharedPreferences!.setDouble(key, value).then((value) {}).catchError((e) {
      print(e.toString());
    });
  }

  static double? getDouble(String value) {
    return sharedPreferences!.getDouble(value);
  }

  static String? getstring(String value) {
    return sharedPreferences!.getString(value);
  }

  static Future clear() async {
    await sharedPreferences!.clear().then((value) {
      print("all cleared");
    });
  }
}
