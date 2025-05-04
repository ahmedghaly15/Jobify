import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widgets/custom_error_widget.dart';
import '../../providers/home_provider.dart';
import 'job_item.dart';
import 'jobs_empty_sliver.dart';
import 'jobs_loading_sliver.dart';

class JobsSliverGridConsumer extends ConsumerWidget {
  const JobsSliverGridConsumer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncJobs = ref.watch(fetchJobsProvider);
    return asyncJobs.when(
      data:
          (jobs) =>
              jobs.isEmpty
                  ? const JobsEmptySliver()
                  : SliverGrid.builder(
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
                  ),
      error:
          (error, _) => SliverFillRemaining(
            hasScrollBody: false,
            child: CustomErrorWidget(
              error: error.toString(),
              onPressed: () => ref.refresh(fetchJobsProvider),
            ),
          ),
      loading: () => const JobsLoadingSliver(),
    );
  }
}
