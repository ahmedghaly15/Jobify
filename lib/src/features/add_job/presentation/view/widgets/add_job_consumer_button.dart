import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/adaptive_circular_progress_indicator.dart';
import '../../../../../core/widgets/primary_button.dart';
import '../../providers/add_job_provider.dart';

class AddJobConsumerButton extends ConsumerWidget {
  const AddJobConsumerButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final addJobResult = ref.watch(addJobProvider);
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
}
