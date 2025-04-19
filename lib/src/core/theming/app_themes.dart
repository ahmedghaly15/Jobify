import 'package:flutter/material.dart';

import '../utils/app_strings.dart';
import 'app_colors.dart';

class AppThemes {
  AppThemes._();

  static ThemeData get light => ThemeData(
    primaryColor: AppColors.primaryColor,
    colorScheme: const ColorScheme.light(primary: AppColors.primaryColor),
    fontFamily: AppStrings.fontFamily,
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.lightModeColor,
  );
}
