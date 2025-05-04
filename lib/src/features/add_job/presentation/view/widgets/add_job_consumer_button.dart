import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobify/src/core/helpers/extensions.dart';
import 'package:jobify/src/features/home/presentation/providers/home_provider.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/widgets/adaptive_circular_progress_indicator.dart';
import '../../../../../core/widgets/primary_button.dart';
import '../../providers/add_job_provider.dart';

class AddJobConsumerButton extends ConsumerWidget {
  const AddJobConsumerButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final addJobResult = ref.watch(addJobProvider);
    _listener(ref, context);
    return PrimaryButton(
      onPressed: () {
        ref.read(addJobProvider.notifier).validateAndAddJob();
      },
      text: AppStrings.addJob,
      child: addJobResult?.whenOrNull(
        loading: () => const AdaptiveCircularProgressIndicator(),
      ),
    );
  }

  void _listener(WidgetRef ref, BuildContext context) {
    ref.listen(addJobProvider, (_, current) {
      current?.whenOrNull(
        data:
            (_) => _onSuccess(context, ref),
        error:
            (error, _) => context.showAnimatedDialog(
              state: CustomDialogStates.error,
              message: error.toString(),
            ),
      );
    });
  }

  void _onSuccess(BuildContext context, WidgetRef ref) {
    context.showAnimatedDialog(
      state: CustomDialogStates.success,
      message: AppStrings.jobAddedSuccessfully,
    );
    // ignore: unused_result
    ref.refresh(fetchJobsProvider.future);
    _resetControllers(ref);
  }

  void _resetControllers(WidgetRef ref) {
    ref.read(positionControllerProvider).clear();
    ref.read(companyControllerProvider).clear();
    ref.read(locationControllerProvider).clear();
    ref.read(statusProvider.notifier).state = AppConstants.jobStatus.first;
    ref.read(modeProvider.notifier).state = AppConstants.jobMode.first;
  }
}
