import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobify/src/core/helpers/extensions.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../../core/models/job.dart';
import '../../../../../core/utils/app_strings.dart';
import 'job_detail.dart';

class JobItemDetails extends StatelessWidget {
  const JobItemDetails({super.key, required this.job});

  final Job? job;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            JobDetail(
              icon: LucideIcons.circleUserRound,
              title: job?.position ?? AppStrings.position,
            ),
            JobDetail(
              icon: LucideIcons.briefcaseBusiness,
              title: job?.company ?? AppStrings.company,
            ),
          ],
        ),
        JobDetail(
          icon: LucideIcons.mapPin,
          title: job?.location ?? AppStrings.location,
        ),
        JobDetail(
          icon: LucideIcons.calendar,
          title: job?.createdAt?.formatToDate() ?? AppStrings.date,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            JobDetail(
              icon: LucideIcons.circleCheck,
              title: job?.status?.enumName ?? AppStrings.status,
            ),
            JobDetail(
              icon: LucideIcons.circleDot,
              title: job?.mode?.enumName ?? AppStrings.mode,
            ),
          ],
        ),
      ],
    );
  }
}
