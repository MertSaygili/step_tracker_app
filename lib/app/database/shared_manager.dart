// ignore_for_file: avoid_positional_boolean_parameters

import 'package:shared_preferences/shared_preferences.dart';

enum SharedEnums { isLogin, pinCode }

class SharedManager {
  SharedManager._();

  static late SharedPreferences _preferences;

  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future<bool> saveBool(SharedEnums key, bool value) {
    return _preferences.setBool(key.toString(), value);
  }

  static bool getBool(SharedEnums key) {
    return _preferences.getBool(key.toString()) ?? false;
  }

  static Future<bool> saveString(SharedEnums key, String value) {
    return _preferences.setString(key.toString(), value);
  }

  static String getString(SharedEnums key) {
    return _preferences.getString(key.toString()) ?? '';
  }
}
