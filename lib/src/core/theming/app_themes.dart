import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/const_strings.dart';
import 'app_colors.dart';

class AppThemes {
  AppThemes._();

  static ThemeData get light => ThemeData(
    primaryColor: AppColors.primaryColor,
    colorScheme: const ColorScheme.light(primary: AppColors.primaryColor),
    fontFamily: ConstStrings.fontFamily,
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.lightModeColor,
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: const WidgetStatePropertyAll(AppColors.primaryColor),
        padding: WidgetStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
        ),
        tapTargetSize: MaterialTapTargetSize.padded,
        minimumSize: const WidgetStatePropertyAll(Size.zero),
      ),
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.resolveWith<Color>((
        Set<WidgetState> states,
      ) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.primaryColor;
        }
        return Colors.white;
      }),
      checkColor: const WidgetStatePropertyAll(Colors.white),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
      side: BorderSide(color: AppColors.color757575, width: 2.w),
    ),
  );
}
