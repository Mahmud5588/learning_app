import 'package:flutter/material.dart';
import 'package:learnig_app/core/color/app_color.dart';
import '../../../../core/responsive/app_responsive.dart';

class MyTextField extends StatelessWidget {
  final String texts;
  final Widget? icon;
  final Widget? element;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final bool obscureText;
  final TextInputType keyboardType;
  final int? maxLines;
  final int? minLines;
  final InputDecoration? decoration;

  const MyTextField({
    super.key,
    required this.texts,
    this.icon,
    this.element,
    this.controller,
    this.onChanged,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.maxLines = 1,
    this.minLines,
    this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      obscureText: obscureText,
      keyboardType: keyboardType,
      maxLines: maxLines,
      minLines: minLines,
      decoration: decoration ??
          InputDecoration(
            hintText: texts,
            prefixIcon: icon,
            suffixIcon: element,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.greyScale500),
              borderRadius: BorderRadius.circular(appWidth(2.5)), // 10 / 400 ~ 0.025 * screenWidth
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.greyScale500),
              borderRadius: BorderRadius.circular(appWidth(3.75)), // 15 / 400 ~ 0.0375 * screenWidth
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(appWidth(3.75)), // 15 / 400 ~ 0.0375 * screenWidth
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: appWidth(4), // 16 / 400 ~ 0.04 * screenWidth
              vertical: appHeight(3.125), // 25 / 800 ~ 0.03125 * screenHeight
            ),
          ),
    );
  }
}