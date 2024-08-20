import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_koo/edge_insets.dart';
import 'package:flutter_riverpod_koo/river_pod/river_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:vote_project/data/user_repository_impl.dart';
import 'package:vote_project/domain/repository/user_repository.dart';
import 'package:vote_project/domain/use_case/get_login_use_case.dart';
import 'package:vote_project/main.dart';
import 'package:vote_project/pages/login/login_notifier.dart';
import 'package:vote_project/route/routes.dart';
import 'package:vote_project/widgets/app_button_widget.dart';
import 'package:vote_project/widgets/app_check_box_widget.dart';

class LoginPage extends RiverProvider<LoginNotifier, LoginViewModel> {
  const LoginPage({super.key});

  @override
  bool outsideUnFocus() => true;

  @override
  Widget build(BuildContext context, provider, notifier) {
    final theme = Theme.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('로그인'),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsetsApp(horizontal: 16, vertical: 12),
          child: Column(
            children: [
              const SizedBox(height: 24,),
              SizedBox(
                height: 52,
                child: TextField(
                  controller: notifier.idController,
                  textAlignVertical: TextAlignVertical.center,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: '아이디',
                    hintStyle: theme.hintColor.regular(14),
                    contentPadding: const EdgeInsetsApp(all: 16),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color(0xffD0D3E5)
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: theme.colorScheme.primary
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16,),
              SizedBox(
                height: 52,
                child: TextField(
                  controller: notifier.pwdController,
                  textAlignVertical: TextAlignVertical.center,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    hintText: '비밀번호',
                    hintStyle: theme.hintColor.regular(14),
                    contentPadding: const EdgeInsetsApp(all: 16),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color(0xffD0D3E5)
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: theme.colorScheme.primary
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12,),
              Row(
                children: [
                  AppCheckBoxWidget(
                    value: provider.isAuto,
                    checkCallback: notifier.updateAutoLoginState,
                  ),
                  Text('자동 로그인', style: theme.textColor.regular(14),)
                ],
              ),
              const SizedBox(height: 24,),
              AppButton(
                onTap: provider.enable ? notifier.login : null,
                child: const Text('로그인'),
              ),
              const SizedBox(height: 12,),
              AppButton(
                onTap: () => context.push(Routes.signUp.name),
                style: theme.getBtnSubStyle,
                child: const Text('회원가입'),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  LoginNotifier createProvider(WidgetRef ref) {
    final match = UserRepositoryImpl().getRepoProvider(ref) as UserRepository;
    return LoginNotifier(
        LoginViewModel(enable: false, isLogin: false),
        GetLoginUseCase(match)
    );
  }
}