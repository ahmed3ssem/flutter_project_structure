import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MySecureStorage {
  final FlutterSecureStorage _secureStorage;

  const MySecureStorage({
    FlutterSecureStorage secureStorage = const FlutterSecureStorage(),
  }) : _secureStorage = secureStorage;

  // Storage Keys
  static const String isLogin = "isLogin";
  static const String token = "token";
  static const String language = "language";
  static const String isDark = "isDark";
  static const String deviceToken = "deviceToken";
  static const String showHomeTutorial = "showHomeTutorial";

  // Generic user data storage keys
  static const String userID = "userID";
  static const String name = "name";
  static const String email = "email";
  static const String image = "image";

  static final FlutterSecureStorage _staticStorage = const FlutterSecureStorage(
    aOptions: AndroidOptions(),
  );

  /// Clears user authentication session data without altering app-level
  /// preferences (e.g. theme or onboarding status).
  static Future<void> clearProfile() async {
    await _staticStorage.delete(key: isLogin);
    await _staticStorage.delete(key: userID);
    await _staticStorage.delete(key: name);
    await _staticStorage.delete(key: image);
    await _staticStorage.delete(key: email);
    await _staticStorage.delete(key: token);
  }

  static Future<void> setUserData({
    required String name,
    required String userId,
    required String token,
    required String email,
    String? imageUrl,
  }) async {
    await setUserID(userId);
    await setName(name);
    await setEmail(email);
    await setToken(token);
    await setIsLogin(true);
    await setImage(imageUrl ?? '');
  }

  static Future<void> clearUserData() async => clearProfile();

  // Getters and Setters
  static Future<String> getUserID() async =>
      await _staticStorage.read(key: userID) ?? "";
  static Future<void> setUserID(String value) async =>
      await _staticStorage.write(key: userID, value: value);

  static Future<String> getName() async =>
      await _staticStorage.read(key: name) ?? "";
  static Future<void> setName(String value) async =>
      await _staticStorage.write(key: name, value: value);

  static Future<String> getEmail() async =>
      await _staticStorage.read(key: email) ?? "";
  static Future<void> setEmail(String value) async =>
      await _staticStorage.write(key: email, value: value);

  static Future<String> getToken() async =>
      await _staticStorage.read(key: token) ?? "";
  static Future<void> setToken(String value) async =>
      await _staticStorage.write(key: token, value: value);

  static Future<String> getDeviceToken() async =>
      await _staticStorage.read(key: deviceToken) ?? "";
  static Future<void> setDeviceToken(String value) async =>
      await _staticStorage.write(key: deviceToken, value: value);

  static Future<String> getImage() async =>
      await _staticStorage.read(key: image) ?? "";
  static Future<void> setImage(String value) async =>
      await _staticStorage.write(key: image, value: value);

  static Future<String> getLanguage() async =>
      await _staticStorage.read(key: language) ?? "en";
  static Future<void> setLanguage(String value) async =>
      await _staticStorage.write(key: language, value: value);

  static Future<bool> getIsDark() async {
    String? value = await _staticStorage.read(key: isDark);
    return value == "true";
  }

  static Future<void> setIsDark(bool value) async {
    await _staticStorage.write(key: isDark, value: value.toString());
  }

  static Future<bool> getIsLogin() async {
    String? value = await _staticStorage.read(key: isLogin);
    return value == "true";
  }

  static Future<void> setIsLogin(bool value) async {
    await _staticStorage.write(key: isLogin, value: value.toString());
  }

  static Future<bool> getShowHomeTutorial() async {
    String? value = await _staticStorage.read(key: showHomeTutorial);
    return value == null || value == "true";
  }

  static Future<void> setShowHomeTutorial(bool value) async {
    await _staticStorage.write(key: showHomeTutorial, value: value.toString());
  }

  /// Handles Keychain persistence on iOS app reinstallation.
  static Future<void> clearSecureStorageOnReinstall() async {
    const String key = 'hasRunBefore';
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool hasRunBefore = prefs.getBool(key) ?? false;

    if (!hasRunBefore) {
      await _staticStorage.deleteAll();
      await prefs.setBool(key, true);
    }
  }

  // Instance methods for DI usage
  Future<String?> read(String key) => _secureStorage.read(key: key);
  Future<void> write(String key, String value) =>
      _secureStorage.write(key: key, value: value);
  Future<void> delete(String key) => _secureStorage.delete(key: key);
  Future<void> deleteAll() => _secureStorage.deleteAll();
}
