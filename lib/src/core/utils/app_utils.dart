import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/app_colors.dart';
import '../theming/app_text_styles.dart';

class AppUtils {
  AppUtils._();

  static InputDecoration decorateTextField({
    String? hintText,
    Widget? prefix,
    Widget? suffix,
    String? label,
    bool filled = false,
    EdgeInsetsGeometry? contentPadding,
    InputBorder? enabledBorder,
    InputBorder? focusedBorder,
    InputBorder? errorBorder,
    InputBorder? focusedErrorBorder,
    InputBorder? disabledBorder,
    InputBorder? border,
    TextStyle? hintStyle,
    bool isDarkMode = false,
  }) {
    return InputDecoration(
      filled: filled,
      fillColor:
          isDarkMode ? AppColors.color1f283b : AppColors.textFormFieldFillColor,
      errorStyle: TextStyle(fontSize: 13.sp, color: Colors.red),
      hintText: hintText,
      hintStyle:
          hintStyle ??
          _textFieldTextStyle.copyWith(color: AppColors.colorC2C2C2),
      errorMaxLines: null,
      prefixIcon: prefix,
      suffixIcon: suffix,
      labelText: label,
      contentPadding: contentPadding ?? _textFieldContentPad,
      enabledBorder: enabledBorder ?? _textFieldUnderlineInputBorder(),
      focusedBorder:
          focusedBorder ??
          _textFieldUnderlineInputBorder(
            borderColor: AppColors.primaryColor,
            width: 2,
          ),
      errorBorder:
          errorBorder ??
          _textFieldUnderlineInputBorder(borderColor: Colors.red, width: 1.3),
      focusedErrorBorder:
          focusedErrorBorder ??
          _textFieldUnderlineInputBorder(borderColor: Colors.red, width: 1.3),
      border: border ?? _textFieldUnderlineInputBorder(),
      disabledBorder: disabledBorder,
    );
  }

  static EdgeInsetsGeometry get _textFieldContentPad =>
      EdgeInsets.symmetric(horizontal: 20.w, vertical: 17.h);

  static TextStyle get _textFieldTextStyle => AppTextStyles.font14Regular;

  static OutlineInputBorder _textFieldUnderlineInputBorder({
    Color? borderColor,
    double width = 1,
  }) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16.r),
      borderSide: BorderSide(
        color: borderColor ?? AppColors.colorEDEDED,
        width: width.w,
      ),
    );
  }
}
