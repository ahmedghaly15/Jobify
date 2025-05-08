import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/const_strings.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';

class AppThemes {
  AppThemes._();

  static ThemeData get light => ThemeData(
    primaryColor: AppColors.primaryColor,
    colorScheme: const ColorScheme.light(primary: AppColors.primaryColor),
    fontFamily: ConstStrings.fontFamily,
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.lightModeColor,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.lightModeColor,
      elevation: 0,
      titleTextStyle: AppTextStyles.font18Bold.copyWith(color: Colors.black),
      centerTitle: true,
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: const WidgetStatePropertyAll(AppColors.primaryColor),
        padding: WidgetStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
        ),
        tapTargetSize: MaterialTapTargetSize.padded,
        minimumSize: const WidgetStatePropertyAll(Size.zero),
        textStyle: WidgetStatePropertyAll(AppTextStyles.font12SemiBold),
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
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: AppColors.lightModeColor,
      indicatorColor: Colors.transparent,
      labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
      iconTheme: WidgetStateProperty.resolveWith<IconThemeData>((states) {
        if (states.contains(WidgetState.selected)) {
          return IconThemeData(color: Colors.white, size: 24.h);
        }
        return IconThemeData(color: AppColors.primaryColor, size: 24.h);
      }),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        iconSize: 16.w,
        foregroundColor: AppColors.primaryColor,
      ),
    ),
  );
}
