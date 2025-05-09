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
    final isEnabled = ref.watch(isEditJobButtonEnabledProvider(job));
    _listener(ref, context);
    return PrimaryButton(
      onPressed:
          isEnabled
              ? () => ref
                  .read(updateJobProvider.notifier)
                  .validateFormAndUpdateJob(job)
              : null,
      text: AppStrings.editJob,
      child: asyncUpdateJob?.whenOrNull(
        loading: () => const AdaptiveCircularProgressIndicator(),
      ),
    );
  }

  void _listener(WidgetRef ref, BuildContext context) {
    ref.listen(updateJobProvider, (_, current) {
      current?.whenOrNull(
        data: (_) {
          context.popTop();
          context.showToast(AppStrings.jobEditedSuccessfully);
        },
        error: (error, __) {
          context.popTop();
          context.showToast(error.toString());
        },
      );
    });
  }
}
