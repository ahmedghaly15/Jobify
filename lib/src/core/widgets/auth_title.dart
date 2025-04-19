import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/app_colors.dart';
import '../theming/app_text_styles.dart';

class AuthTitle extends StatelessWidget {
  const AuthTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 50.h, bottom: 8.h),
      child: Text(
        title,
        style: AppTextStyles.font24Bold.copyWith(color: AppColors.primaryColor),
      ),
    );
  }
}
