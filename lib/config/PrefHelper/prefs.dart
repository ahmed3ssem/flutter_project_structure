import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static late SharedPreferences _prefs;

  static Future<SharedPreferences> init() async {
    _prefs = await SharedPreferences.getInstance();
    return _prefs;
  }

  // Setters
  static Future<bool> setBool(String key, bool value) async =>
      await _prefs.setBool(key, value);

  static Future<bool> setDouble(String key, double value) async =>
      await _prefs.setDouble(key, value);

  static Future<bool> setInt(String key, int value) async =>
      await _prefs.setInt(key, value);

  static Future<bool> setString(String key, String value) async =>
      await _prefs.setString(key, value);

  static Future<bool> setStringList(String key, List<String> value) async =>
      await _prefs.setStringList(key, value);

  // Getters
  static bool isContain(String key) => _prefs.containsKey(key);

  static bool getBool(String key, [bool defaultValue = false]) =>
      _prefs.getBool(key) ?? defaultValue;

  static int getInt(String key, [int defaultValue = 0]) =>
      _prefs.getInt(key) ?? defaultValue;

  static double getDouble(String key, [double defaultValue = 0.0]) =>
      _prefs.getDouble(key) ?? defaultValue;

  static List<String> getStringList(String key) =>
      _prefs.getStringList(key) ?? [];

  static String getString(String key, [String defaultValue = '']) {
    return _prefs.getString(key) ?? defaultValue;
  }

  static Future<bool> remove(String key) async => await _prefs.remove(key);

  static Future<bool> clear() async => await _prefs.clear();
}
