import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_text_styles.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/custom_sliver_app_bar.dart';
import '../../../../core/widgets/primary_button.dart';
import 'widgets/email_verification_pin_put.dart';
import 'widgets/have_acc_questions.dart';

@RoutePage()
class OtpVerificationView extends StatelessWidget {
  const OtpVerificationView({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
        child: CustomScrollView(
          slivers: [
            const CustomSliverAppBar(titleText: AppStrings.verifyYourEmail),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    AppStrings.enterTheSentVerificationCode,
                    style: AppTextStyles.font13Regular.copyWith(
                      color: AppColors.color757575,
                    ),
                  ),
                  Row(
                    spacing: 8.w,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        email,
                        style: AppTextStyles.font13Regular.copyWith(
                          color: AppColors.color757575,
                        ),
                      ),
                      IconButton(
                        onPressed: () => context.pop(),
                        style: IconButton.styleFrom(
                          shape: const CircleBorder(),
                          backgroundColor: AppColors.primaryColor,
                          foregroundColor: Colors.white,
                          iconSize: 16.h,
                          elevation: 16,
                        ),
                        icon: const Icon(Icons.edit),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 24.h, bottom: 16.h),
                    child: const EmailVerificationPinput(),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 24.h),
                    child: HaveAccQuestion(
                      question: AppStrings.didntReceiveCode,
                      onPressed: () {},
                      buttonText: AppStrings.resend,
                    ),
                  ),
                  PrimaryButton(text: AppStrings.verify, onPressed: () {}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
