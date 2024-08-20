import 'package:flutter/material.dart';
import 'package:vote_project/service/auth_service.dart';

class AppService with ChangeNotifier {
  static final AppService instance = AppService._();

  AppService._();

  bool _isLogin = false;

  bool get isLogin => _isLogin;
  set isLogin(bool isLogin) {
    _isLogin = isLogin;
    notifyListeners();
  }

  // void init() {
  //   AuthService.instance.user.addListener(() {
  //     debugPrint('AppService user listening : ${AuthService.instance.user.value}');
  //     _isLogin = AuthService.instance.user.value != null;
  //   });
  // }
}