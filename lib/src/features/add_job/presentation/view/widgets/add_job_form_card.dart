import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theming/app_text_styles.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';

class AddJobFormCard extends StatelessWidget {
  const AddJobFormCard({super.key});

  @override
  Widget build(BuildContext context) {
    const moveBegin = -50.0;
    const moveEnd = 0.0;
    return Card(
      elevation: 8.h,
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 16.h,
          children: [
            Text(
              AppStrings.addJob,
              style: AppTextStyles.font36SemiBold,
            ).animate().fadeIn().moveY(
              begin: moveBegin.h,
              end: moveEnd,
              duration: 400.milliseconds,
            ),
            const CustomTextFormField(
              hintText: AppStrings.position,
            ).animate().fadeIn().moveY(
              begin: moveBegin.h,
              end: moveEnd,
              duration: 400.milliseconds,
              delay: 200.milliseconds,
            ),
            const CustomTextFormField(
              hintText: AppStrings.company,
            ).animate().fadeIn().moveY(
              begin: moveBegin.h,
              end: moveEnd,
              duration: 400.milliseconds,
              delay: 400.milliseconds,
            ),
            const CustomTextFormField(
              hintText: AppStrings.location,
            ).animate().fadeIn().moveY(
              begin: moveBegin.h,
              end: moveEnd,
              duration: 400.milliseconds,
              delay: 600.milliseconds,
            ),
            const CustomTextFormField(
              hintText: AppStrings.status,
            ).animate().fadeIn().moveY(
              begin: moveBegin.h,
              end: moveEnd,
              duration: 400.milliseconds,
              delay: 800.milliseconds,
            ),
            const CustomTextFormField(
              hintText: AppStrings.mode,
            ).animate().fadeIn().moveY(
              begin: moveBegin.h,
              end: moveEnd,
              duration: 400.milliseconds,
              delay: 1000.milliseconds,
            ),
          ],
        ),
      ),
    );
  }
}
