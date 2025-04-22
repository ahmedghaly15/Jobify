import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobify/src/core/helpers/extensions.dart';

import '../../../../../core/models/jobify_user.dart';
import '../../../../../core/router/app_router.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/widgets/primary_button.dart';
import '../../providers/login_providers.dart';

class LoginConsumerButton extends ConsumerWidget {
  const LoginConsumerButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _listener(ref, context);
    return PrimaryButton(
      onPressed: () {
        ref.read(loginProvider.notifier).validateFormAndLogin();
      },
      text: AppStrings.signIn,
    );
  }

  void _listener(WidgetRef ref, BuildContext context) {
    ref.listen(loginProvider, (_, current) {
      current?.whenOrNull(
        loading: () {
          context.unfocusKeyboard();
          context.showLoadingDialog();
        },
        data: (jobifyUser) async {
          currentUser = jobifyUser;
          await JobifyUser.secureUser(jobifyUser);
          context.popTop();
          context.replaceRoute(const HomeRoute());
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
