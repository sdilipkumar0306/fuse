import 'package:shared_preferences/shared_preferences.dart';

class SPS {
  static Future<void> setvalue(String key, dynamic data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (data is String) {
      prefs.setString(key, data);
    } else if (data is int) {
      prefs.setInt(key, data);
    } else if (data is double) {
      prefs.setDouble(key, data);
    } else if (data is bool) {
      prefs.setBool(key, data);
    } else if (data is List<String>) {
      prefs.setStringList(key, data);
    }
  }

  static Future<dynamic> getValue(String key, Type data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (data == String) {
      return prefs.getString(key);
    } else if (data == int) {
      return prefs.getInt(key);
    } else if (data == double) {
      return prefs.getDouble(key);
    } else if (data == bool) {
      return prefs.getBool(key);
    } else if (data == List) {
      return prefs.getStringList(key);
    }
  }

  static Future<Object?> getObject(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.get(key);
  }

  static Future<List<String>> getAllKeys() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getKeys().toList();
  }

  static Future<bool> isPresent(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(key);
  }

  static Future<bool> clear() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.clear();
  }

  static Future<void> reload() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.reload();
  }

  static Future<bool> remove(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove(key);
  }

  static Future<List<bool>> getUserChatprop(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return [
      prefs.getBool(key + "_pinned") ?? false,
      prefs.getBool(key + "_muted") ?? false,
      prefs.getBool(key + "_achived") ?? false,
    ];
  }
  static Future<void> removeUserChatprop(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.remove(key + "_pinned");
      prefs.remove(key + "_muted") ;
      prefs.remove(key + "_achived");
  }

  ///  1 -- pinned
  ///
  ///  2 -- muted
  ///
  ///  3 -- achived
  static Future<void> setUserChatprop(String key, bool value, int type) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    switch (type) {
      case 1:
        prefs.setBool(key + "_pinned", value);
        break;
      case 2:
        prefs.setBool(key + "_muted", value);
        break;
      case 3:
        prefs.setBool(key + "_achived", value);
        break;
      default:
        prefs.setBool(key + "_pinned", value);
    }
  }
}
