import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_koo/edge_insets.dart';
import 'package:flutter_riverpod_koo/river_pod/river_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:vote_project/data/user_repository_impl.dart';
import 'package:vote_project/domain/repository/user_repository.dart';
import 'package:vote_project/domain/use_case/get_sign_up_use_case.dart';
import 'package:vote_project/enums/gender.dart';
import 'package:vote_project/main.dart';
import 'package:vote_project/pages/sign_up/sign_up_notifier.dart';
import 'package:vote_project/widgets/app_button_widget.dart';

class SignUpPage extends RiverProvider<SignUpNotifier, SignUpViewModel> {
  const SignUpPage({super.key});

  @override
  bool outsideUnFocus() => true;

  @override
  Widget build(BuildContext context, provider, SignUpNotifier notifier) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('회원가입'),),
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
                  keyboardType: TextInputType.text,
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
              const SizedBox(height: 16,),
              SizedBox(
                height: 52,
                child: TextField(
                  controller: notifier.rePwdController,
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
              const SizedBox(height: 16,),
              ToggleButtons(
                isSelected: provider.genderSelected,
                onPressed: notifier.setGender,
                borderRadius: BorderRadius.circular(8),
                fillColor: Colors.white,
                selectedColor: const Color(0xFF4975FF),
                selectedBorderColor: const Color(0xFF4975FF),
                borderColor: const Color(0xffD0D3E5),
                disabledBorderColor: const Color(0xffD0D3E5),
                children: Gender.values.map((e) => Container(
                    width: getToggleItemWidth(context, Gender.values.length),
                    alignment: Alignment.center,
                    child: Text(
                      e.name,
                      style: e.index == notifier.genderSelected.indexWhere((e) => e)
                          ? theme.textColor.semiBold(14)?.copyWith(
                          color: const Color(0xFF4975FF)
                      ) : theme.textColor.regular(14)?.copyWith(
                          color: const Color(0xffA0A3BD)
                      ),
                    ))).toList(),
              ),
              const SizedBox(height: 24,),
              AppButton(
                onTap: provider.enable ? () async {
                  await notifier.signUp();
                  if (!context.mounted) return;

                  context.pop();
                } : null,
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
  SignUpNotifier createProvider(WidgetRef ref) {
    final match = UserRepositoryImpl().getRepoProvider(ref) as UserRepository;
    return SignUpNotifier(SignUpViewModel(genderSelected: [true, false]), GetSignUpUseCase(match));
  }

  double getToggleItemWidth(BuildContext context, int itemCnt) {
    final toggleBorderWidth = itemCnt + 1;
    final deviceWidth = MediaQuery.of(context).size.width -
        32 - toggleBorderWidth;
    final dividedWidth = (deviceWidth / itemCnt).floor().toDouble();

    return deviceWidth > (dividedWidth * itemCnt)
        ? dividedWidth
        : (deviceWidth / itemCnt).truncateToDouble();
  }
}