import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobify/src/core/helpers/extensions.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/models/job.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/svgs_manager.dart';

import 'edit_job_dialog_content.dart';
import 'job_detail.dart';

class JobItem extends StatelessWidget {
  const JobItem({super.key, this.job, this.isLoading = false});

  final bool isLoading;
  final Job? job;

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
              child:
                  isLoading
                      ? Skeleton.leaf(
                        enabled: true,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.all(
                              Radius.circular(16.r),
                            ),
                          ),
                        ),
                      )
                      : SvgPicture.asset(
                        SvgsManager.chooseRandomSvg(),
                        fit: BoxFit.cover,
                      ),
            ),
            Expanded(
              child: Column(
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
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    context.showAnimatedDialog(
                      content: EditJobDialogContent(job: job),
                    );
                  },
                  icon: const LucideIconWidget(LucideIcons.pencilRuler),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const LucideIconWidget(LucideIcons.trash),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
