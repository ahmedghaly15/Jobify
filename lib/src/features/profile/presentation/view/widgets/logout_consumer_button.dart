import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobify/src/core/helpers/extensions.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../../core/models/jobify_user.dart';
import '../../../../../core/router/app_router.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../providers/profile_providers.dart';

class LogOutConsumerButton extends ConsumerWidget {
  const LogOutConsumerButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _listener(ref, context);
    return IconButton(
      onPressed:
          () => context.displayAdaptiveDialog(
            contentText: AppStrings.sureToLogOut,
            yesOnPressed: () => ref.read(logOutProvider.notifier).logOut(),
          ),
      icon: const LucideIconWidget(LucideIcons.logOut, color: Colors.red),
    );
  }

  void _listener(WidgetRef ref, BuildContext context) {
    ref.listen(logOutProvider, (_, current) {
      current?.whenOrNull(
        data: (_) async => await _onSuccess(context),
        error:
            (error, _) => context.showAnimatedDialog(
              message: error.toString(),
              state: CustomDialogStates.error,
            ),
      );
    });
  }

  Future<void> _onSuccess(BuildContext context) async {
    await JobifyUser.deleteSecuredUser();
    context.router.replaceAll([const AuthRoute()]);
  }
}
