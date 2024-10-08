
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:vote_project/models/api/user_model.dart';
import 'package:vote_project/service/app_service.dart';
import 'package:vote_project/util/shared_preferences.dart';

class AuthService with ChangeNotifier {
  static final AuthService instance = AuthService._();

  AuthService._();

  final user = ValueNotifier<UserModel?>(null)..addListener(updateUserState);

  static void updateUserState() {
    AppService.instance.isLogin = AuthService.instance.user.value != null;
  }

  Future<void> init() async {
    final isAuto = await SharedPreferencesKey.isAutoLogin.get<bool>();
    final userResult = await SharedPreferencesKey.user.get<Map>();
    if ((isAuto != null && isAuto) && userResult != null) {
      user.value = UserModel.fromJson(userResult as Map<String, dynamic>);
      AppService.instance.isLogin = true;
    } else {
      user.value = null;
      AppService.instance.isLogin = false;
    }
  }

  Future<void> signIn(UserModel model) async {
    user.value = model;
    SharedPreferencesKey.user.set(model.toJson());
    AppService.instance.isLogin = user.value != null;
    notifyListeners();
  }

  void logOut() {
    SharedPreferencesKey.user.remove();
    SharedPreferencesKey.isAutoLogin.remove();
    AppService.instance.isLogin = false;

    user.value = null;
    AppService.instance.isLogin = false;
  }
}