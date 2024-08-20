import 'package:flutter/material.dart';

class AppService with ChangeNotifier {
  static final AppService instance = AppService._();

  AppService._();

  bool _isLogin = false;

  bool get isLogin => _isLogin;
  set isLogin(bool isLogin) {
    _isLogin = isLogin;
    notifyListeners();
  }
}