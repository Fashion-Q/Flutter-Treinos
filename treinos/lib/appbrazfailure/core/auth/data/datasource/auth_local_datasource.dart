import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:treinos/appbrazfailure/core/auth/data/model/user_model.dart';

const keySessionUser = "SESSION_USER";

abstract class AuthLocalDataSource {
  Future<UserModel> getCurrentUser();
  Future<bool> setCurrentUser(UserModel user);
  Future<bool> cleanUser();
}

class AuthLocalDataSourrceImpl implements AuthLocalDataSource {
  const AuthLocalDataSourrceImpl();

  @override
  Future<UserModel> getCurrentUser() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final userJsonString = sharedPreferences.getString(keySessionUser);
    if (userJsonString == null) throw Exception("Usuário não encontrado");
    final result = UserModel.fromJson(jsonDecode(userJsonString));
    return result;
  }

  @override
  Future<bool> setCurrentUser(UserModel user) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final userJson = jsonEncode(user.toJson());
    final result = sharedPreferences.setString(keySessionUser, userJson);
    return result;
  }

  @override
  Future<bool> cleanUser() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final result = sharedPreferences.remove(keySessionUser);
    return result;
  }
}
