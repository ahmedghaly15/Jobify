import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_text_styles.dart';
import '../../../../../core/utils/app_strings.dart';

class OrContinueWith extends StatelessWidget {
  const OrContinueWith({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 8.w,
      children: [
        const _GreyDivider(),
        Text(
          AppStrings.orContinueWith,
          style: AppTextStyles.font12Regular.copyWith(
            color: AppColors.color9E9E9E,
          ),
        ),
        const _GreyDivider(),
      ],
    );
  }
}

class _GreyDivider extends StatelessWidget {
  // ignore: unused_element_parameter
  const _GreyDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Divider(color: AppColors.colorE0E0E0, thickness: 1.5.h),
    );
  }
}
