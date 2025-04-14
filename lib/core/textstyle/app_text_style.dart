import 'package:flutter/material.dart';
import '../color/app_color.dart';

class AppTextStyles {
  static const String _fontFamily = "Urbanist";

  static TextStyle _textStyle({
    required double fontSize,
    required FontWeight fontWeight,
    Color color = AppColor.greyScale900,
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontFamily: _fontFamily,
      color: color,
    );
  }

  // Headings
  static TextStyle heading1({Color color = AppColor.greyScale900}) =>
      _textStyle(fontSize: 48, fontWeight: FontWeight.w700, color: color);

  static TextStyle heading2({Color color = AppColor.greyScale900}) =>
      _textStyle(fontSize: 40, fontWeight: FontWeight.w700, color: color);

  static TextStyle heading3({Color color = AppColor.greyScale900}) =>
      _textStyle(fontSize: 32, fontWeight: FontWeight.w700, color: color);

  static TextStyle heading4({Color color = AppColor.greyScale900}) =>
      _textStyle(fontSize: 24, fontWeight: FontWeight.w700, color: color);

  static TextStyle heading5({Color color = AppColor.greyScale900}) =>
      _textStyle(fontSize: 20, fontWeight: FontWeight.w700, color: color);

  static TextStyle heading6({Color color = AppColor.greyScale900}) =>
      _textStyle(fontSize: 18, fontWeight: FontWeight.w700, color: color);

  // Body XL
  static TextStyle bodyXLargeBold({Color color = AppColor.greyScale900}) =>
      _textStyle(fontSize: 18, fontWeight: FontWeight.w700, color: color);

  static TextStyle bodyXLargeSemiBold({Color color = AppColor.greyScale900}) =>
      _textStyle(fontSize: 18, fontWeight: FontWeight.w600, color: color);

  static TextStyle bodyXLargeMedium({Color color = AppColor.greyScale900}) =>
      _textStyle(fontSize: 18, fontWeight: FontWeight.w500, color: color);

  static TextStyle bodyXLargeRegular({Color color = AppColor.greyScale900}) =>
      _textStyle(fontSize: 18, fontWeight: FontWeight.w400, color: color);

  // Body Large
  static TextStyle bodyLargeBold({Color color = AppColor.greyScale900}) =>
      _textStyle(fontSize: 16, fontWeight: FontWeight.w700, color: color);

  static TextStyle bodyLargeSemiBold({Color color = AppColor.greyScale900}) =>
      _textStyle(fontSize: 16, fontWeight: FontWeight.w600, color: color);

  static TextStyle bodyLargeMedium({Color color = AppColor.greyScale900}) =>
      _textStyle(fontSize: 16, fontWeight: FontWeight.w500, color: color);

  static TextStyle bodyLargeRegular({Color color = AppColor.greyScale900}) =>
      _textStyle(fontSize: 16, fontWeight: FontWeight.w400, color: color);

  // Body Medium
  static TextStyle bodyMediumBold({Color color = AppColor.greyScale900}) =>
      _textStyle(fontSize: 14, fontWeight: FontWeight.w700, color: color);

  static TextStyle bodyMediumSemiBold({Color color = AppColor.greyScale900}) =>
      _textStyle(fontSize: 14, fontWeight: FontWeight.w600, color: color);

  static TextStyle bodyMediumMedium({Color color = AppColor.greyScale900}) =>
      _textStyle(fontSize: 14, fontWeight: FontWeight.w500, color: color);

  static TextStyle bodyMediumRegular({Color color = AppColor.greyScale900}) =>
      _textStyle(fontSize: 14, fontWeight: FontWeight.w400, color: color);

  // Body Small
  static TextStyle bodySmallBold({Color color = AppColor.greyScale900}) =>
      _textStyle(fontSize: 12, fontWeight: FontWeight.w700, color: color);

  static TextStyle bodySmallMedium({Color color = AppColor.greyScale900}) =>
      _textStyle(fontSize: 12, fontWeight: FontWeight.w500, color: color);

  static TextStyle bodySmallRegular({Color color = AppColor.greyScale900}) =>
      _textStyle(fontSize: 12, fontWeight: FontWeight.w400, color: color);

  // Body XSmall
  static TextStyle bodyXSmallBold({Color color = AppColor.greyScale900}) =>
      _textStyle(fontSize: 10, fontWeight: FontWeight.w700, color: color);

  static TextStyle bodyXSmallSemiBold({Color color = AppColor.greyScale900}) =>
      _textStyle(fontSize: 10, fontWeight: FontWeight.w600, color: color);

  static TextStyle bodyXSmallMedium({Color color = AppColor.greyScale900}) =>
      _textStyle(fontSize: 10, fontWeight: FontWeight.w500, color: color);

  static TextStyle bodyXSmallRegular({Color color = AppColor.greyScale900}) =>
      _textStyle(fontSize: 10, fontWeight: FontWeight.w400, color: color);
}
