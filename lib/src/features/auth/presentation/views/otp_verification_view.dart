import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobify/src/core/helpers/extensions.dart';

import '../../../../core/router/app_router.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_text_styles.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/adaptive_circular_progress_indicator.dart';
import '../../../../core/widgets/primary_button.dart';
import '../providers/otp_verification_provider.dart';
import 'widgets/auth_sub_title.dart';
import 'widgets/auth_title.dart';
import 'widgets/email_verification_pin_put.dart';

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

class VerifyOtpConsumerButton extends ConsumerWidget {
  const VerifyOtpConsumerButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final verifyOtpResult = ref.watch(otpVerificationProvider);
    final otp = ref.watch(otpTextProvider);
    _listener(ref, context);
    return PrimaryButton(
      text: AppStrings.verify,
      onPressed:
          otp.isEmpty
              ? null
              : () {
                ref.read(otpVerificationProvider.notifier).verifyOtp();
              },
      child: verifyOtpResult?.whenOrNull(
        loading:
            () => SizedBox.square(
              dimension: 24.h,
              child: const AdaptiveCircularProgressIndicator(),
            ),
      ),
    );
  }

  void _listener(WidgetRef ref, BuildContext context) {
    ref.listen(otpVerificationProvider, (_, current) {
      current?.whenOrNull(
        error: (error, _) {
          context.showAnimatedDialog(
            state: CustomDialogStates.error,
            message: error.toString(),
          );
        },
        data: (otpVerified) {
          if (otpVerified) {
            context.showAnimatedDialog(
              state: CustomDialogStates.success,
              message: AppStrings.otpVerifiedSuc,
              onAction: () async {
                context.popTop();
                await Future.delayed(const Duration(milliseconds: 350));
                context.router.pushAndPopUntil(
                  const LoginRoute(),
                  predicate: (route) => route.data?.name == LoginRoute.name,
                );
              },
            );
          } else {
            context.showAnimatedDialog(
              state: CustomDialogStates.error,
              message: AppStrings.invalidOtp,
            );
          }
        },
      );
    });
  }
}

class ResendOtpConsumer extends ConsumerWidget {
  const ResendOtpConsumer({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final resendTimer = ref.watch(resendTimerProvider);
    _listener(ref, context);
    return TextButton.icon(
      onPressed:
          resendTimer == 0
              ? () {
                ref.read(resendOtpProvider.notifier).resendOtp(email);
              }
              : null,
      icon: const Text(AppStrings.resend),
      label:
          resendTimer == 0
              ? const SizedBox.shrink()
              : Text(
                resendTimer.toString(),
                style: AppTextStyles.font12Regular,
              ),
      style: ButtonStyle(
        textStyle: WidgetStatePropertyAll(AppTextStyles.font12SemiBold),
        padding: WidgetStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
        ),
        tapTargetSize: MaterialTapTargetSize.padded,
        minimumSize: const WidgetStatePropertyAll(Size.zero),
        foregroundColor: _disabledStatesColor,
        iconColor: _disabledStatesColor,
      ),
    );
  }

  WidgetStateProperty<Color> get _disabledStatesColor =>
      WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) {
          return Colors.blue.shade100;
        }
        return AppColors.primaryColor;
      });

  void _listener(WidgetRef ref, BuildContext context) {
    ref.listen(resendOtpProvider, (_, current) {
      current?.whenOrNull(
        loading: () => context.showLoadingDialog(),
        data: (_) {
          context.popTop();
          context.showAnimatedDialog(
            state: CustomDialogStates.success,
            message: AppStrings.otpResentSuc,
            onAction: () {
              context.popTop();
              ref.read(resendTimerProvider.notifier).resetTimer();
            },
          );
        },
        error: (error, _) {
          context.popTop();
          context.showAnimatedDialog(
            state: CustomDialogStates.error,
            message: error.toString(),
          );
        },
      );
    });
  }
}
