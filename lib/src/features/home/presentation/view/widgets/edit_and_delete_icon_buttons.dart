import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobify/src/core/helpers/extensions.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../../core/models/job.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../stats/presentation/providers/stats_providers.dart';
import '../../providers/home_providers.dart';
import 'edit_job_dialog_content.dart';

class EditAndDeleteIconButtons extends StatelessWidget {
  const EditAndDeleteIconButtons({super.key, required this.job});

  final Job? job;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed:
              () => context.showAnimatedDialog(
                content: EditJobDialogContent(job: job),
              ),
          icon: const LucideIconWidget(LucideIcons.pencilRuler),
        ),
        DeleteIconButtonConsumer(job: job),
      ],
    );
  }
}

class DeleteIconButtonConsumer extends ConsumerWidget {
  const DeleteIconButtonConsumer({super.key, required this.job});

  final Job? job;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _onSuccessListener(ref);
    _listener(ref, context);
    return IconButton(
      onPressed:
          () => context.displayAdaptiveDialog(
            contentText: AppStrings.areYouSureToDeleteJob,
            yesOnPressed: () {
              ref.read(deleteJobProvider.notifier).deleteJob(job!.id);
            },
          ),
      icon: const LucideIconWidget(LucideIcons.trash, color: Colors.red),
    );
  }

  void _listener(WidgetRef ref, BuildContext context) {
    ref.listen(deleteJobProvider, (_, current) {
      current?.whenOrNull(
        data: (_) {
          if (context.router.canPop()) {
            context.popTop();
            context.showToast(AppStrings.jobDeletedSuccessfully);
          }
        },
        error: (error, _) {
          if (context.router.canPop()) {
            context.popTop();
            context.showToast(error.toString());
          }
        },
      );
    });
  }

  void _onSuccessListener(WidgetRef ref) {
    ref.listen(deleteJobProvider, (_, current) {
      current?.whenOrNull(
        data: (_) async {
          await ref.refresh(fetchJobsProvider.future);
          await ref.refresh(statsProvider(job!.status!).future);
        },
      );
    });
  }
}
