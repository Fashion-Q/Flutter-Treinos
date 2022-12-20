import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:simulation/repository/repository.dart';

class RepositoryPrefsSheared implements Repository {
  @override
  Future<bool> saveJson(Map<String, dynamic> json, String key) async {
    SharedPreferences salve = await SharedPreferences.getInstance();
    salve.setString(key, jsonEncode(json));
    return true;
  }

  @override
  Future<bool> saveInt(int index, String key) async {
    SharedPreferences save = await SharedPreferences.getInstance();
    save.setInt(key, index);
    return true;
  }

  @override
  Future<Map<String, dynamic>> loadJson(String key) async {
    SharedPreferences load = await SharedPreferences.getInstance();
    return jsonDecode(load.getString(key) ?? "{}");
  }

  @override
  Future<int> loadIndex(String key) async {
    SharedPreferences load = await SharedPreferences.getInstance();
    return load.getInt(key) ?? 0;
  }

  @override
  Future<void> remove(String key) async {
    SharedPreferences remove = await SharedPreferences.getInstance();
    await remove.remove(key);
  }
}
