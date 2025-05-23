import 'package:flutter/material.dart';
import 'package:learnig_app/core/color/app_color.dart';
import '../../../../core/responsive/app_responsive.dart';

class MyElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? color;

  const MyElevatedButton({
    required this.text,
    required this.onPressed,
    super.key,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: appHeight(6.875),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor:
          color != null ? AppColor.greyScale600 : AppColor.disabledButton,
          side: const BorderSide(color: Color(0x00eeeeee)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(appWidth(12.5)),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: appWidth(4),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}