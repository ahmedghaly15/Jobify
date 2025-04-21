import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobify/src/core/helpers/extensions.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_text_styles.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../providers/otp_verification_provider.dart';

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
              ref.read(resendTimerProvider.notifier).resetTimer();
              context.popTop();
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
