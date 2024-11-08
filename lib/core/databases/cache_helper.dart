import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences prefs;

  init() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future<bool> saveData({required String key, required dynamic value}) async {
    if (value is bool) {
      return await prefs.setBool(key, value);
    }
    if (value is String) {
      return await prefs.setString(key, value);
    }
    if (value is int) {
      return await prefs.setInt(key, value);
    } else {
      return await prefs.setDouble(key, value);
    }
  }

  dynamic getData({required String key}) {
    return prefs.get(key);
  }
}
