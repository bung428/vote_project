import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:vote_project/pages/detail/vote_detail_page.dart';
import 'package:vote_project/pages/main/main_page.dart';
import 'package:vote_project/pages/splash/splash_page.dart';
import 'package:vote_project/route/routes.dart';

final appRouters = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: Routes.splash.name,
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
      ],
    ),
  ],
  redirect: (context, state) {
    final splashLocation = state.namedLocation(Routes.splash.name);

    final isGoingToInit = state.matchedLocation == splashLocation;

    if (isGoingToInit) {
      return splashLocation;
    } else {
      return null;
    }
  }
);