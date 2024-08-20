import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:vote_project/pages/detail/vote_detail_page.dart';
import 'package:vote_project/pages/login/login_page.dart';
import 'package:vote_project/pages/main/main_page.dart';
import 'package:vote_project/pages/sign_up/sign_up_page.dart';
import 'package:vote_project/pages/splash/splash_page.dart';
import 'package:vote_project/route/routes.dart';
import 'package:vote_project/service/app_service.dart';

final appRouters = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: Routes.splash.name,
  refreshListenable: AppService.instance,
  routes: [
    GoRoute(
      path: Routes.main.name,
      name: Routes.main.name,
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const MainPage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          FadeTransition(
            opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
            child: child,
          )
      ),
      routes: [
        GoRoute(
          path: Routes.detail.path,
          name: Routes.detail.name,
          pageBuilder: (context, state) => CustomTransitionPage(
              key: state.pageKey,
              child: VoteDetailPage(
                id: state.uri.queryParameters['id'] ?? '',
                optionId: state.uri.queryParameters['optionId'] ?? '',
              ),
              transitionsBuilder: (context, animation, secondaryAnimation, child) =>
                  FadeTransition(
                    opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                    child: child,
                  )
          ),
        ),
        GoRoute(
          path: Routes.splash.path,
          name: Routes.splash.name,
          pageBuilder: (context, state) => CustomTransitionPage(
              key: state.pageKey,
              child: const SplashPage(),
              transitionsBuilder: (context, animation, secondaryAnimation, child) =>
                  FadeTransition(
                    opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                    child: child,
                  )
          ),
        ),
        GoRoute(
          path: Routes.login.path,
          name: Routes.login.name,
          pageBuilder: (context, state) => CustomTransitionPage(
              key: state.pageKey,
              child: const LoginPage(),
              transitionsBuilder: (context, animation, secondaryAnimation, child) =>
                  FadeTransition(
                    opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                    child: child,
                  )
          ),
        ),
        GoRoute(
          path: Routes.signUp.path,
          name: Routes.signUp.name,
          pageBuilder: (context, state) => CustomTransitionPage(
              key: state.pageKey,
              child: const SignUpPage(),
              transitionsBuilder: (context, animation, secondaryAnimation, child) =>
                  FadeTransition(
                    opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                    child: child,
                  )
          ),
        ),
      ],
    ),
  ],
  redirect: (context, state) {
    final appService = AppService.instance;

    final homeLocation = state.namedLocation(Routes.main.name);
    final loginLocation = state.namedLocation(Routes.login.name);
    final splashLocation = state.namedLocation(Routes.splash.name);
    final signUpLocation = state.namedLocation(Routes.signUp.name);

    final isLoggedIn = appService.isLogin;

    final isGoingToInit = state.matchedLocation == splashLocation;
    final isGoingToSignUp = state.matchedLocation == signUpLocation;
    final isGoingToLogin = state.matchedLocation == loginLocation;

    print('KBG state.matchedLocation : ${state.matchedLocation}');

    if (isGoingToInit) {
      return splashLocation;
    }

    // if (isGoingToSignUp) {
    //   return signUpLocation;
    // }

    if (!isLoggedIn && isGoingToLogin) {
      return loginLocation;
    }

    if ((isLoggedIn && isGoingToLogin) || (isGoingToInit)) {
      return homeLocation;
    }

    return null;
  }
);