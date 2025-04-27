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
              borderRadius: BorderRadius.circular(appWidth(2.5)),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.greyScale500),
              borderRadius: BorderRadius.circular(appWidth(3.75)),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(appWidth(3.75)),
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: appWidth(4),
              vertical: appHeight(3.125),
            ),
          ),
    );
  }
}