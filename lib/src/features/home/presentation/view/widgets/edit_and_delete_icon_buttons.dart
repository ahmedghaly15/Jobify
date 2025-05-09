import 'package:flutter/material.dart';
import 'package:jobify/src/core/helpers/extensions.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../../core/models/job.dart';
import 'delete_job_icon_button_consumer.dart';
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
        DeleteJobIconButtonConsumer(job: job),
      ],
    );
  }
}
