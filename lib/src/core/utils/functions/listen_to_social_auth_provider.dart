import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobify/src/core/router/app_router.dart';
import 'package:jobify/src/core/utils/constants.dart';

import '../../helpers/extensions.dart';
import '../../models/jobify_user.dart';
import '../../supabase/supabase_error_message.dart';
import '../../supabase/supabase_request_result.dart';

/// Listens to the given [provider] and when the [AsyncValue] is in either
/// [AsyncValue.data] or [AsyncValue.error] state, takes the following actions:
///
/// - If the value is in [AsyncValue.data] state, it waits for 1.5 seconds
///   and then navigates to the [HomeRoute] route.
/// - If the value is in [AsyncValue.error] state, it shows an animated dialog
///   with the given error message.
void listenToSocialAuthProvider(
  WidgetRef ref,
  BuildContext context,
  ProviderListenable<AsyncValue<dynamic>?> provider, {
  bool shouldAwaitBeforeNavigation = true,
}) {
  ref.listen(provider, (_, current) {
    current?.whenOrNull(
      data: (_) async {
        if (shouldAwaitBeforeNavigation) {
          await Future.delayed(const Duration(milliseconds: 1500));
        }
        currentUser = JobifyUser(
          user: ref.read(supabaseAuthProvider).currentUser,
        );
        await JobifyUser.secureUser(currentUser!);
        context.router.replaceAll([const HomeRoute()]);
      },
      error: (error, _) {
        if (error.toString() != SupabaseErrorMessage.noAccessTokenFound &&
            error.toString() != SupabaseErrorMessage.noIdTokenFound) {
          context.showAnimatedDialog(
            state: CustomDialogStates.error,
            message: error.toString(),
          );
        }
      },
    );
  });
}
