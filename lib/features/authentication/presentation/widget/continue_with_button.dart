import 'package:flutter/material.dart';
import 'package:learnig_app/core/textstyle/app_text_style.dart';
import '../../../../core/color/app_color.dart';
import '../../../../core/responsive/app_responsive.dart';

class ContinueWithButton extends StatelessWidget {
  final String texts;
  final Widget icon;
  final VoidCallback onPressed;

  const ContinueWithButton({
    required this.texts,
    required this.icon,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: appHeight(6.875), // 55 / 800 ~ 0.06875 * screenHeight
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          side: BorderSide(color: AppColor.greyScale200),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(appWidth(1.25)), // 5 / 400 ~ 0.0125 * screenWidth
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            icon,
            Text(
              texts,
              style: AppTextStyles.bodyLargeSemiBold(color: AppColor.greyScale900),
            ),
          ],
        ),
      ),
    );
  }
}