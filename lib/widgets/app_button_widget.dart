import 'package:flutter/material.dart';
import 'package:flutter_riverpod_koo/edge_insets.dart';
import 'package:vote_project/main.dart';

enum AppButtonType {
  elevated,
  outlined,
}

class AppTextButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String text;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  final EdgeInsetsGeometry padding;
  final TextDecoration textDecoration;

  const AppTextButton({
    super.key,
    this.onTap,
    this.color,
    this.fontWeight,
    this.textDecoration = TextDecoration.none,
    this.fontSize,
    required this.text,
    this.padding = EdgeInsets.zero
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        minimumSize: Size.zero,
        padding: EdgeInsets.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Padding(
        padding: padding,
        child: Text(
          text,
          style: TextStyle(
            color: color ?? const Color(0xFF4975FF),
            fontSize: fontSize,
            fontWeight: fontWeight ?? FontWeight.w600,
            decoration: textDecoration
          ),
        ),
      )
    );
  }
}

class AppButton extends StatelessWidget {
  final double? size;
  final double? width;
  final double? height;
  final bool enable;
  final ButtonStyle? style;
  final VoidCallback? onTap;
  final AppButtonType type;
  final Widget child;

  const AppButton({
    super.key,
    this.size,
    this.onTap,
    this.style,
    this.height = 48,
    this.width = double.infinity,
    this.enable = true,
    this.type = AppButtonType.elevated,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final width = size ?? this.width;
    final height = size ?? this.height;
    final theme = Theme.of(context);

    final child = Container(
      width: width,
      height: height,
      alignment: AlignmentDirectional.center,
      child: this.child,
    );

    return switch(type) {
      AppButtonType.elevated => ElevatedButton(
        onPressed: onTap,
        style: style ?? theme.getBtnMainStyle,
        child: child,
      ),
      AppButtonType.outlined => OutlinedButton(
        onPressed: onTap,
        style: style,
        child: child,
      ),
    };
  }
}

class AppBottomButton extends StatelessWidget {
  final double height;
  final Widget child;
  final AppButtonType type;
  final ButtonStyle? style;
  final VoidCallback? onTap;

  const AppBottomButton({
    super.key,
    this.onTap,
    this.style,
    this.height = 48,
    this.type = AppButtonType.elevated,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          ),
          color: theme.scaffoldBackgroundColor
        ),
        padding: const EdgeInsetsApp(horizontal: 16, bottom: 16),
        alignment: Alignment.center,
        width: double.infinity,
        height: 64,
        child: AppButton(
          height: height,
          type: type,
          style: style ?? theme.getBtnMainStyle,
          onTap: onTap,
          child: child,
        ),
      ),
    );
  }
}

extension ButtonStyleExt on ThemeData {
  ButtonStyle get getBtnPrimaryStyle => ElevatedButton.styleFrom(
    backgroundColor: primaryColor,
    foregroundColor: scaffoldBackgroundColor,
    shadowColor: Colors.transparent,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
  );

  ButtonStyle get getBtnMainStyle => ElevatedButton.styleFrom(
    backgroundColor: const Color(0xff5F8BFF),
    foregroundColor: scaffoldBackgroundColor,
    shadowColor: Colors.transparent,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
  );

  ButtonStyle get getBtnSubStyle => ElevatedButton.styleFrom(
    backgroundColor: const Color(0xffECF1FF),
    foregroundColor: const Color(0xff5F8BFF),
    shadowColor: Colors.transparent,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
  );

  ButtonStyle get getBtnCancelStyle => ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    backgroundColor: const Color(0xffD0D3E5),
    foregroundColor: scaffoldBackgroundColor,
    shadowColor: Colors.transparent,
  );

  ButtonStyle getOutlinedDefaultStyle({
    double borderWidth = 1,
  }) => OutlinedButton.styleFrom(
    side: BorderSide(width: borderWidth, color: textColor),
    foregroundColor: textColor,
  );
}