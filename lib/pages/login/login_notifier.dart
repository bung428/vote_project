import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod_koo/river_pod/river_notifier.dart';
import 'package:flutter_riverpod_koo/stream_subscription.dart';
import 'package:go_router/go_router.dart';
import 'package:vote_project/route/routes.dart';
import 'package:vote_project/util/shared_preferences.dart';

import '../../domain/use_case/get_login_use_case.dart';

class LoginViewModel {
  final bool enable;
  final bool isLogin;
  final bool isAuto;

  LoginViewModel({required this.enable, required this.isLogin, this.isAuto = false});

  LoginViewModel copyWith({
    bool? enable,
    bool? isLogin,
    bool? isAuto,
  }) => LoginViewModel(
      enable: enable ?? this.enable,
      isLogin: isLogin ?? this.isLogin,
      isAuto: isAuto ?? this.isAuto,
  );
}

class LoginNotifier extends RiverNotifier<LoginViewModel> with AppStreamSubscription {
  final GetLoginUseCase loginUseCase;

  LoginNotifier(super.state, this.loginUseCase);

  final idController = TextEditingController();
  final pwdController = TextEditingController();

  @override
  void onInit() {
    idController.addListener(_updateEnable);
    pwdController.addListener(_updateEnable);
  }

  @override
  void dispose() {
    idController.removeListener(_updateEnable);
    pwdController.removeListener(_updateEnable);
    idController.dispose();
    pwdController.dispose();
    super.dispose();
  }

  void _updateEnable() {
    var lowerCasedText = idController.text.toLowerCase();
    if (idController.text != lowerCasedText) {
      idController.value = idController.value.copyWith(
        text: lowerCasedText,
        selection: TextSelection.collapsed(offset: lowerCasedText.length),
      );
    }

    state = state.copyWith(
      enable: idController.text.isNotEmpty && pwdController.text.isNotEmpty
    );
  }

  void updateAutoLoginState(bool? value) {
    if (value == null) return;

    state = state.copyWith(isAuto: value);
    SharedPreferencesKey.isAutoLogin.set(value);
  }

  Future<void> login() async {
    final id = idController.text;
    final pwd = pwdController.text;
    if (id.isEmpty || pwd.isEmpty) return;

    final context = buildContext;
    if (context == null) return;

    streamSubscription<bool>(
      stream: Stream.fromFuture(loginUseCase(id, pwd)),
      onData: (_) {
        state = state.copyWith(
          isLogin: _
        );
        if (state.isLogin) {
          context.go(Routes.main.name);
        }
      }
    );
  }
}