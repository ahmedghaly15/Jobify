import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobify/src/core/helpers/extensions.dart';

import '../../../../../core/models/jobify_user.dart';
import '../../../../../core/router/app_router.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/widgets/primary_button.dart';
import '../../providers/otp_verification_provider.dart';
import '../../providers/register_providers.dart';

class RegisterButtonConsumer extends ConsumerWidget {
  const RegisterButtonConsumer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _sendOtpProviderListener(ref, context);
    _registerProviderListener(ref, context);
    return PrimaryButton(
      onPressed: () {
        ref.read(registerProvider.notifier).validateFormAndRegister();
      },
      text: AppStrings.signUp,
    );
  }

  void _registerProviderListener(WidgetRef ref, BuildContext context) {
    ref.listen(registerProvider, (_, current) {
      current?.whenOrNull(
        loading: () {
          context.unfocusKeyboard();
          context.showLoadingDialog();
        },
        data:
            (jobifyUser) async =>
                await _onRegisterSuccess(context, jobifyUser, ref),
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

  Future<void> _onRegisterSuccess(
    BuildContext context,
    JobifyUser jobifyUser,
    WidgetRef ref,
  ) async {
    currentUser = jobifyUser;
    await JobifyUser.secureUser(jobifyUser);
    ref.read(sendOtpProvider.notifier).sendOtp(jobifyUser.user!.email!);
  }

  void _sendOtpProviderListener(WidgetRef ref, BuildContext context) {
    ref.listen(sendOtpProvider, (_, current) {
      current?.whenOrNull(
        data:
            (_) => _onOtpSent(
              context,
              ref.read(registerEmailControllerProvider).text.trim(),
            ),
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

  void _onOtpSent(BuildContext context, String email) {
    context.popTop();
    context.showAnimatedDialog(
      state: CustomDialogStates.success,
      message: AppStrings.accountCreatedSuccessfully,
      barrierDismissible: false,
      onAction: () {
        context.popTop();
        Future.delayed(const Duration(milliseconds: 500), () {
          context.pushRoute(OtpVerificationRoute(email: email));
        });
      },
    );
  }
}
