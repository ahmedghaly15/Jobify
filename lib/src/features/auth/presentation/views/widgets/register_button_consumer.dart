import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobify/src/core/helpers/extensions.dart';

import '../../../../../core/router/app_router.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/primary_button.dart';
import '../../providers/register_providers.dart';

class RegisterButtonConsumer extends ConsumerWidget {
  const RegisterButtonConsumer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _listener(ref, context);
    return PrimaryButton(
      onPressed: () {
        ref.read(registerProvider.notifier).validateFormAndRegister();
      },
      text: AppStrings.signUp,
    );
  }

  void _listener(WidgetRef ref, BuildContext context) {
    ref.listen(registerProvider, (_, current) {
      current?.whenOrNull(
        loading: () {
          context.unfocusKeyboard();
          context.showLoadingDialog();
        },
        data: (user) {
          context.popTop();
          context.showAnimatedDialog(
            state: CustomDialogStates.success,
            message: AppStrings.accountCreatedSuccessfully,
            barrierDismissible: false,
            onAction:
                () => context.router.pushAndPopUntil(
                  const OtpVerificationRoute(),
                  predicate: (route) => route.data?.name == LoginRoute.name,
                ),
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
