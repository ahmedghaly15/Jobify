import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobify/src/core/helpers/extensions.dart';

import '../../../../../core/router/app_router.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/adaptive_circular_progress_indicator.dart';
import '../../../../../core/widgets/primary_button.dart';
import '../../providers/otp_verification_provider.dart';

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
        data: (otpVerified) => _onOtpVerified(otpVerified, context),
      );
    });
  }

  void _onOtpVerified(bool otpVerified, BuildContext context) {
    if (otpVerified) {
      context.showAnimatedDialog(
        state: CustomDialogStates.success,
        message: AppStrings.otpVerifiedSuc,
        onAction: () async => await _popDialogAndPushLogin(context),
      );
    } else {
      context.showAnimatedDialog(
        state: CustomDialogStates.error,
        message: AppStrings.invalidOtp,
      );
    }
  }

  Future<void> _popDialogAndPushLogin(BuildContext context) async {
    context.popTop();
    await Future.delayed(const Duration(milliseconds: 350));
    context.router.pushAndPopUntil(
      const LoginRoute(),
      predicate: (route) => route.data?.name == LoginRoute.name,
    );
  }
}
