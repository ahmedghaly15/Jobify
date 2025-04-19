import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/app_colors.dart';
import '../theming/app_text_styles.dart';
import '../utils/app_assets.dart';
import '../utils/app_strings.dart';

class AppLogoAndName extends StatelessWidget {
  const AppLogoAndName({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 8.w,
      children: [
        Image.asset(Assets.jobifyIcon),
        Text(
          AppStrings.appTitle,
          style: AppTextStyles.font24Bold.copyWith(
            color: AppColors.primaryColor,
          ),
        ),
      ],
    );
  }
}
