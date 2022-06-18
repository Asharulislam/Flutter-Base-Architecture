// ignore_for_file: non_constant_identifier_names

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceManager {
  final String TOKEN = "token";
  final String PROFILE = "profile";

  static late final SharedPreferences instance;

  static Future<SharedPreferences> init() async =>
      instance = await SharedPreferences.getInstance();

  SharedPreferenceManager._();

  static final SharedPreferenceManager _singleton = SharedPreferenceManager._();

  static SharedPreferenceManager get sharedInstance => _singleton;

  // helper method to store token
  storeToken(String token) => instance.setString(TOKEN, token);

  //helper method to get token
  String? getToken() => instance.getString(TOKEN);

  bool hasToken() => instance.getString(TOKEN) != null;

  //helper method to store any string
  storeString(String key, String value) => instance.setString(key, value);

  //helper method to get any string
  getString(String key) => instance.getString(key);

  //helper method to store any integer
  storeInt(String key, int value) => instance.setInt(key, value);

  //helper method to get any integer
  getInteger(String key) => instance.getInt(key);

  clearPref() => instance.clear();
}
