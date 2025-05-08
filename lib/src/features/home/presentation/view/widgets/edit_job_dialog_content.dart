import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/models/job.dart';
import '../../../../../core/theming/app_text_styles.dart';
import '../../../../../core/utils/app_strings.dart';

import 'edit_job_consumer_button.dart';
import 'edit_job_form_consumer.dart';

class EditJobDialogContent extends StatelessWidget {
  const EditJobDialogContent({super.key, required this.job});

  final Job? job;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 16.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppStrings.editJob, style: AppTextStyles.font36SemiBold),
          EditJobFormConsumer(job: job!),
          EditJobConsumerButton(job: job!),
        ],
      ),
    );
  }
}
