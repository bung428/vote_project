import 'package:flutter/material.dart';
import 'package:flutter_riverpod_koo/edge_insets.dart';
import 'package:vote_project/main.dart';


class AppTextFieldWidget extends StatelessWidget {
  final double height;
  final String hintText;
  final VoidCallback? suffixCallback;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final TextEditingController? textController;

  const AppTextFieldWidget({
    super.key,
    this.height = 52,
    this.textInputType,
    this.textInputAction,
    this.suffixCallback,
    this.textController,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      height: height,
      child: TextField(
        controller: textController,
        textAlignVertical: TextAlignVertical.center,
        keyboardType: textInputType,
        textInputAction: textInputAction,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: theme.hintColor.regular(14),
          suffixIcon: suffixCallback != null ? IconButton(
            icon: const Icon(Icons.close),
            onPressed: suffixCallback,
          ) : null,
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
    );
  }
}

