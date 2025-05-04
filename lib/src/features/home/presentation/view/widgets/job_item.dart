import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/svgs_manager.dart';
import 'job_detail.dart';

class JobItem extends StatelessWidget {
  const JobItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.h,
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SvgPicture.asset(
                SvgsManager.chooseRandomSvg(),
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Column(
                spacing: 8.h,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  JobDetail(
                    icon: LucideIcons.briefcaseBusiness,
                    title: AppStrings.company,
                  ),
                  JobDetail(
                    icon: LucideIcons.mapPin,
                    title: AppStrings.location,
                  ),
                  JobDetail(icon: LucideIcons.calendar, title: AppStrings.date),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      JobDetail(
                        icon: LucideIcons.circleCheck,
                        title: AppStrings.status,
                      ),
                      JobDetail(
                        icon: LucideIcons.circleDot,
                        title: AppStrings.mode,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
