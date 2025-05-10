import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:jobify/src/core/helpers/extensions.dart';

import '../../../../../core/helpers/remember_me_helper.dart';
import '../../../../../core/models/jobify_user.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/widgets/adaptive_circular_progress_indicator.dart';
import '../../../../../core/widgets/primary_button.dart';
import '../../providers/profile_providers.dart';

class UpdateProfileConsumerButton extends ConsumerWidget {
  const UpdateProfileConsumerButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEnabled = ref.watch(isUpdateProfileButtonEnabledProvider);
    final asyncUpdateProfile = ref.watch(updateProfileProvider);
    _listener(ref, context);
    return PrimaryButton(
      onPressed:
          isEnabled
              ? () {
                ref
                    .read(updateProfileProvider.notifier)
                    .validateFormAndUpdate();
              }
              : null,
      text: AppStrings.update,
      child: asyncUpdateProfile?.whenOrNull(
        loading: () => const AdaptiveCircularProgressIndicator(),
      ),
    );
  }

  void _listener(WidgetRef ref, BuildContext context) {
    ref.listen(updateProfileProvider, (_, current) {
      current?.whenOrNull(
        data: (jobifyUser) async => await _onSuccess(jobifyUser, context),
        error:
            (error, _) => context.showAnimatedDialog(
              message: error.toString(),
              state: CustomDialogStates.error,
            ),
      );
    });
  }

  Future<void> _onSuccess(JobifyUser jobifyUser, BuildContext context) async {
    currentUser = jobifyUser;
    await JobifyUser.secureUser(jobifyUser);
    context.showToast(AppStrings.profileUpdatedSuccessfully);
    await RememberMeHelper.deleteRememberedData();
  }
}
