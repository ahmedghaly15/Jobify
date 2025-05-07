import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobify/src/core/helpers/extensions.dart';

import '../../../../../core/models/job.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_text_styles.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/custom_skeletonizer.dart';
import '../../providers/stats_providers.dart';

class StatsSliverListConsumer extends StatelessWidget {
  const StatsSliverListConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: JobStatus.values.length,
      itemBuilder:
          (_, index) => Consumer(
            builder: (_, ref, __) {
              final jobStatus = JobStatus.values[index];
              final asyncFetchedMatchesStatusCount = ref.watch(
                statsProvider(jobStatus),
              );
              return asyncFetchedMatchesStatusCount
                  .when(
                    loading:
                        () =>
                            const CustomSkeletonizer(child: AnimatedStatItem()),
                    data:
                        (fetchedMatchesStatusCount) => AnimatedStatItem(
                          titleText:
                              '${JobStatus.values[index].enumName} ${AppStrings.jobs}',
                          trailingText: fetchedMatchesStatusCount.toString(),
                        ),
                    error: (_, __) => const SizedBox.shrink(),
                  )
                  .animate()
                  .fadeIn(duration: 400.ms)
                  .then(delay: (index * 200).ms)
                  .slideX(begin: -2, end: 0);
            },
          ),
    );
  }
}

class AnimatedStatItem extends StatelessWidget {
  const AnimatedStatItem({super.key, this.titleText, this.trailingText});

  final String? titleText, trailingText;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              titleText ?? 'Pending jobs',
              style: AppTextStyles.font24SemiBold,
            ),
            Text(
              trailingText ?? '0',
              style: AppTextStyles.font36Bold.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
