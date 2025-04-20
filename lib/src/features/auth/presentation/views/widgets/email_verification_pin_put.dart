import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobify/src/core/helpers/extensions.dart';
import 'package:pinput/pinput.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_text_styles.dart';
import '../../providers/otp_verification_provider.dart';

class EmailVerificationPinput extends ConsumerWidget {
  const EmailVerificationPinput({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pinputController = ref.watch(pinputVerificationController);
    return Pinput(
      autofocus: true,
      controller: pinputController,
      animationDuration: const Duration(milliseconds: 200),
      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
      showCursor: true,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      defaultPinTheme: PinTheme(
        textStyle: AppTextStyles.font16Regular,
        height: 40.0.h,
        width: 40.0.w,
        decoration: BoxDecoration(
          color: AppColors.colorD9D9D9.withAlpha(153),
          borderRadius: BorderRadiusDirectional.circular(15.0),
        ),
      ),
      focusedPinTheme: PinTheme(
        textStyle: AppTextStyles.font16SemiBold,
        height: 48.0.h,
        width: 48.0.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadiusDirectional.circular(15.0),
          border: Border.all(color: AppColors.primaryColor, width: 2.w),
        ),
      ),
      onCompleted: (_) => context.unfocusKeyboard(),
      length: 6,
    );
  }
}
