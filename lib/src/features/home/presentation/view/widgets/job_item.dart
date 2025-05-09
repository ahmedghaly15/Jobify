import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/models/job.dart';
import '../../../../../core/utils/svgs_manager.dart';

import 'edit_and_delete_icon_buttons.dart';
import 'job_item_details.dart';

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
            Expanded(child: JobItemDetails(job: job)),
            EditAndDeleteIconButtons(job: job),
          ],
        ),
      ),
    );
  }
}
