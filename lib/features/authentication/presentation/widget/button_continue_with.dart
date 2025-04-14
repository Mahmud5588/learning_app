import 'package:flutter/material.dart';
import '../../../../core/color/app_color.dart';
import '../../../../core/responsive/app_responsive.dart';

class ButtonContinueWith extends StatelessWidget {
  final dynamic icon;
  final VoidCallback onPressed;

  const ButtonContinueWith({
    required this.icon,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: appHeight(7.5),
      width: appWidth(22.5),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(appWidth(1.25)),
          ),
        ),
        child: icon,
      ),
    );
  }
}