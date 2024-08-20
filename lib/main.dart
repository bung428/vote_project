import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vote_project/firebase_options.dart';
import 'package:vote_project/route/router.dart';
import 'package:vote_project/service/auth_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await AuthService.instance.init();
  // AppService.instance.init();

  runApp(const ProviderScope(child: VoteApp()));
}


class VoteApp extends StatelessWidget {
  const VoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'VoteApp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: lightColorScheme,
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          scrolledUnderElevation: 0,
        ),
      ),
      routerConfig: appRouters,
    );
  }
}

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Colors.blueAccent,
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFFE1F1FF),
  onPrimaryContainer: Color(0xFF007AFF),
  secondary: Color(0xFF00B3CC),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFFE7FAEE),
  onSecondaryContainer: Color(0xFF34C759),
  tertiary: Color(0xFFFF9500),
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xFFFFF4E3),
  onTertiaryContainer: Color(0xFFFF9500),
  error: Color(0xFFFF3B30),
  onError: Color(0xFFFFFFFF),
  errorContainer: Color(0xFFFFEAEA),
  onErrorContainer: Color(0xFFFF3B30),
  outline: Color(0xFFEEEEEE),
  background: Color(0xFFFFFFFF),
  onBackground: Color(0xFF111111),
  surface: Color(0xFFFCF8FF),
  onSurface: Color(0xFF000000),
  // Text Color
  surfaceVariant: Color(0xFFE5E1EC),
  onSurfaceVariant: Color(0xFF47464F),
  inverseSurface: Color(0xFF313036),
  onInverseSurface: Color(0xFFF3EFF7),
  inversePrimary: Color(0xFFC5C0FF),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF5C5698),
  outlineVariant: Color(0xFFC8C5D0),
  scrim: Color(0xFF000000),
);

extension TextStyleByTheme on ThemeData {
  Color get textColor => colorScheme.onSurface;

  Color get primaryTextColor => colorScheme.onPrimary;

  Color get secondTextColor => colorScheme.onSecondary;

  Color get tertiaryTextColor => colorScheme.onTertiary;

  Color get errorTextColor => colorScheme.onError;
}

extension AppTextStyle on Color {
  TextStyle? thin(
      double size, {
        double? height,
        FontStyle? fontStyle,
        TextDecoration? decoration,
        Color? decorationColor,
        TextDecorationStyle? decorationStyle,
        double? decorationThickness,
      }) {
    return TextStyle(
      color: this,
      height: height != null ? height / size : null,
      fontSize: size,
      fontStyle: fontStyle,
      decoration: decoration,
      decorationColor: decorationColor,
      decorationStyle: decorationStyle,
      decorationThickness: decorationThickness,
      fontWeight: FontWeight.w100,
    );
  }

  TextStyle? extraLight(
      double size, {
        double? height,
        FontStyle? fontStyle,
        TextDecoration? decoration,
        Color? decorationColor,
        TextDecorationStyle? decorationStyle,
        double? decorationThickness,
      }) {
    return TextStyle(
      color: this,
      height: height != null ? height / size : null,
      fontSize: size,
      fontStyle: fontStyle,
      decoration: decoration,
      decorationColor: decorationColor,
      decorationStyle: decorationStyle,
      decorationThickness: decorationThickness,
      fontWeight: FontWeight.w200,
    );
  }

  TextStyle? light(
      double size, {
        double? height,
        FontStyle? fontStyle,
        TextDecoration? decoration,
        Color? decorationColor,
        TextDecorationStyle? decorationStyle,
        double? decorationThickness,
      }) {
    return TextStyle(
      color: this,
      height: height != null ? height / size : null,
      fontSize: size,
      fontStyle: fontStyle,
      decoration: decoration,
      decorationColor: decorationColor,
      decorationStyle: decorationStyle,
      decorationThickness: decorationThickness,
      fontWeight: FontWeight.w300,
    );
  }

  TextStyle? regular(
      double size, {
        double? height,
        FontStyle? fontStyle,
        TextDecoration? decoration,
        Color? decorationColor,
        TextDecorationStyle? decorationStyle,
        double? decorationThickness,
      }) {
    return TextStyle(
      color: this,
      height: height != null ? height / size : null,
      fontSize: size,
      fontStyle: fontStyle,
      decoration: decoration,
      decorationColor: decorationColor,
      decorationStyle: decorationStyle,
      decorationThickness: decorationThickness,
      fontWeight: FontWeight.normal,
    );
  }

  TextStyle? medium(
      double size, {
        double? height,
        FontStyle? fontStyle,
        TextDecoration? decoration,
        Color? decorationColor,
        TextDecorationStyle? decorationStyle,
        double? decorationThickness,
      }) {
    return TextStyle(
      color: this,
      height: height != null ? height / size : null,
      fontSize: size,
      fontStyle: fontStyle,
      decoration: decoration,
      decorationColor: decorationColor,
      decorationStyle: decorationStyle,
      decorationThickness: decorationThickness,
      fontWeight: FontWeight.w500,
    );
  }

  TextStyle? semiBold(
      double size, {
        double? height,
        FontStyle? fontStyle,
        TextDecoration? decoration,
        Color? decorationColor,
        TextDecorationStyle? decorationStyle,
        double? decorationThickness,
      }) {
    return TextStyle(
      color: this,
      height: height != null ? height / size : null,
      fontSize: size,
      fontStyle: fontStyle,
      decoration: decoration,
      decorationColor: decorationColor,
      decorationStyle: decorationStyle,
      decorationThickness: decorationThickness,
      fontWeight: FontWeight.w600,
    );
  }

  TextStyle? bold(
      double size, {
        double? height,
        FontStyle? fontStyle,
        TextDecoration? decoration,
        Color? decorationColor,
        TextDecorationStyle? decorationStyle,
        double? decorationThickness,
      }) {
    return TextStyle(
      color: this,
      height: height != null ? height / size : null,
      fontSize: size,
      fontStyle: fontStyle,
      decoration: decoration,
      decorationColor: decorationColor,
      decorationStyle: decorationStyle,
      decorationThickness: decorationThickness,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle? extraBold(
      double size, {
        double? height,
        FontStyle? fontStyle,
        TextDecoration? decoration,
        Color? decorationColor,
        TextDecorationStyle? decorationStyle,
        double? decorationThickness,
      }) {
    return TextStyle(
      color: this,
      height: height != null ? height / size : null,
      fontSize: size,
      fontStyle: fontStyle,
      decoration: decoration,
      decorationColor: decorationColor,
      decorationStyle: decorationStyle,
      decorationThickness: decorationThickness,
      fontWeight: FontWeight.w800,
    );
  }

  TextStyle? black(
      double size, {
        double? height,
        FontStyle? fontStyle,
        TextDecoration? decoration,
        Color? decorationColor,
        TextDecorationStyle? decorationStyle,
        double? decorationThickness,
      }) {
    return TextStyle(
      color: this,
      height: height != null ? height / size : null,
      fontSize: size,
      fontStyle: fontStyle,
      decoration: decoration,
      decorationColor: decorationColor,
      decorationStyle: decorationStyle,
      decorationThickness: decorationThickness,
      fontWeight: FontWeight.w900,
    );
  }
}