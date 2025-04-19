import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_text_styles.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/app_logo_and_name.dart';
import '../../../../core/widgets/primary_button.dart';

@RoutePage()
class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 48.h, horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 24.h,
          children: [
            const AppLogoAndName().animate().fadeIn(duration: 1.seconds),
            const Spacer(),
            RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: AppStrings.job,
                        style: AppTextStyles.font36Bold.copyWith(
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: ' ${AppStrings.tracking} ',
                        style: AppTextStyles.font36Bold.copyWith(
                          color: AppColors.primaryColor,
                        ),
                      ),
                      TextSpan(
                        text: AppStrings.app,
                        style: AppTextStyles.font36Bold.copyWith(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                )
                .animate()
                .fadeIn(delay: 500.milliseconds)
                .slideY(delay: 500.milliseconds),
            Text(
                  AppStrings.onboardingDescription,
                  style: AppTextStyles.font14Regular,
                )
                .animate()
                .fadeIn(delay: 800.milliseconds)
                .slideY(delay: 800.milliseconds),
            PrimaryButton(
              onPressed: () {},
              text: AppStrings.getStarted,
            ).animate().fadeIn(delay: 1.seconds).slideY(delay: 1.seconds),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
