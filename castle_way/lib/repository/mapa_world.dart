import 'dart:convert';
// import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RepositoryMapWorld {
  Future<bool> setGameMap(Map<String, Map<String, dynamic>> mapa) async {
    SharedPreferences save = await SharedPreferences.getInstance();
    if (await save.setString('mapWorld', json.encode(mapa))) {
      return true;
    }
    return false;
  }

  Future<Map<String, Map<String, dynamic>>> getGameMap() async {
    SharedPreferences load = await SharedPreferences.getInstance();
    String a = load.getString('mapWorld')!;

    Map<String, dynamic> json1 = json.decode(a);
    final Map<String, Map<String, dynamic>> finalMapWorld = {};
    json1.forEach((key, value) {
      finalMapWorld[key] = value as Map<String, dynamic>;
    });
    return finalMapWorld;
  }

  Future<bool> saveCurrentStage(Map<String, dynamic> json) async {
    SharedPreferences salve = await SharedPreferences.getInstance();
    if (await salve.setString('currentStage', jsonEncode(json))) {
      return true;
    }

    return false;
  }

  Future<Map<String, dynamic>> loadCurrentStage() async {
    SharedPreferences load = await SharedPreferences.getInstance();
    return jsonDecode(load.getString('currentStage') ?? "{}");
  }

  Future<void> remove(String key) async {
    SharedPreferences remove = await SharedPreferences.getInstance();
    await remove.remove(key);
  }
}
