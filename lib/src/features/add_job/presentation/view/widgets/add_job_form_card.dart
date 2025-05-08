import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theming/app_text_styles.dart';
import '../../../../../core/utils/app_strings.dart';
import 'add_job_form_consumer.dart';

class AddJobFormCard extends StatelessWidget {
  const AddJobFormCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.h,
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
        child: Column(
          spacing: 16.h,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppStrings.addJob, style: AppTextStyles.font36SemiBold),
            const AddJobFormConsumer(),
          ],
        ),
      ),
    );
  }
}
