import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_text_styles.dart';
import '../../../../core/utils/app_strings.dart';
import 'widgets/auth_sub_title.dart';
import 'widgets/auth_title.dart';
import 'widgets/email_verification_pin_put.dart';
import 'widgets/resend_otp_consumer.dart';
import 'widgets/verify_otp_consumer_button.dart';

@RoutePage()
class OtpVerificationView extends StatelessWidget {
  const OtpVerificationView({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: AuthTitle(title: AppStrings.verifyYourEmail),
            ),
            SliverToBoxAdapter(
              child: AuthSubTitle(
                subTitle: '${AppStrings.enterTheSentVerificationCode}: $email',
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const EmailVerificationPinput(),
                  Container(
                    margin: EdgeInsets.only(bottom: 24.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppStrings.otpExpiresIn,
                          style: AppTextStyles.font12Regular,
                        ),
                        ResendOtpConsumer(email: email),
                      ],
                    ),
                  ),
                  const VerifyOtpConsumerButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
