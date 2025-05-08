import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:jobify/src/core/helpers/extensions.dart';

import '../../../../../core/models/job.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/adaptive_circular_progress_indicator.dart';
import '../../../../../core/widgets/primary_button.dart';
import '../../providers/home_providers.dart';

class EditJobConsumerButton extends ConsumerWidget {
  const EditJobConsumerButton({super.key, required this.job});

  final Job job;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncUpdateJob = ref.watch(updateJobProvider);
    _listener(ref, context);
    return PrimaryButton(
      onPressed: () {
        ref.read(updateJobProvider.notifier).validateFormAndUpdateJob(job);
      },
      text: AppStrings.editJob,
      child: asyncUpdateJob?.whenOrNull(
        loading: () => const AdaptiveCircularProgressIndicator(),
      ),
    );
  }

  void _listener(WidgetRef ref, BuildContext context) {
    ref.listen(updateJobProvider, (_, current) {
      current?.whenOrNull(
        data: (_) async {
          context.popTop();
          await Future.delayed(const Duration(milliseconds: 500));
          context.showAnimatedDialog(
            state: CustomDialogStates.success,
            message: AppStrings.jobEditedSuccessfully,
          );
        },
        error: (error, __) async {
          context.popTop();
          await Future.delayed(const Duration(milliseconds: 500));
          context.showAnimatedDialog(
            state: CustomDialogStates.error,
            message: error.toString(),
          );
        },
      );
    });
  }
}
