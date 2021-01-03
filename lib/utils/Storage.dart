import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  get(String key) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.get(key);
  }

  // getAll(String key, int param) async {
  //   final SharedPreferences prefs = await _prefs;
  //   return prefs.getAll();
  // }

  setInt(String key, int param) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.setInt(key, param);
  }
  getInt(String key) async {
    final SharedPreferences prefs = await _prefs;
    dynamic res = prefs.getInt(key);
    res ??= 0;
    return res;
  }

  setDouble(String key, double param) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.setDouble(key, param);
  }
  getDouble(String key) async {
    final SharedPreferences prefs = await _prefs;
    dynamic res = prefs.getDouble(key);
    res ??= 0.0;
    return res;
  }

  setString(String key, String param) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.setString(key, param);
  }
  getString(String key) async {
    final SharedPreferences prefs = await _prefs;
    dynamic res = prefs.getString(key);
    res ??= '';
    return res;
  }

  setStringList(String key, List<String> param) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.setStringList(key, param);
  }
  getStringList(String key) async {
    final SharedPreferences prefs = await _prefs;
    dynamic res = prefs.getStringList(key);
    res ??= [];
    return res;
  }

  setBool(String key, bool param) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.setBool(key, param);
  }
  getBool(String key) async {
    final SharedPreferences prefs = await _prefs;
    dynamic res = prefs.getBool(key);
    res ??= false;
    return res;
  }
}