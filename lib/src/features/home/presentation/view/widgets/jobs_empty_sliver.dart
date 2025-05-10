import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/theming/app_text_styles.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_strings.dart';

class JobsEmptySliver extends StatelessWidget {
  const JobsEmptySliver({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child:
            Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 16.h,
                  children: [
                    SvgPicture.asset(Assets.svgsJobOne, fit: BoxFit.cover),
                    Text(
                      AppStrings.noJobsFound,
                      style: AppTextStyles.font14Medium,
                      textAlign: TextAlign.center,
                    ),
                  ],
                )
                .animate()
                .fadeIn(duration: 500.milliseconds, curve: Curves.elasticIn)
                .scale(),
      ),
    );
  }
}
