import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vote_project/route/routes.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    showSplash();
    super.initState();
  }

  Future<void> showSplash() async {
    await Future.delayed(const Duration(seconds: 1));
    if (mounted) {
      context.pushReplacement(Routes.main.name);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Image.asset(
            'assets/images/logo.png',
            fit: BoxFit.contain,
          )
        ),
      ),
    );
  }
}