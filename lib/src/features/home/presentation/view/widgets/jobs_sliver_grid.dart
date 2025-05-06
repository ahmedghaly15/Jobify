import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/models/job.dart';
import 'job_item.dart';

class JobsSliverGrid extends StatelessWidget {
  const JobsSliverGrid({super.key, required this.jobs});

  final List<Job> jobs;

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: jobs.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        mainAxisSpacing: 16.h,
        crossAxisSpacing: 8.w,
      ),
      itemBuilder:
          (_, index) =>
              JobItem(job: jobs[index])
                  .animate()
                  .fadeIn(duration: const Duration(milliseconds: 500))
                  .scale(),
    );
  }
}
