import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/widgets/custom_error_widget.dart';
import '../../../../home/presentation/providers/home_provider.dart';
import '../../../../home/presentation/view/widgets/jobs_loading_sliver.dart';
import '../../../../home/presentation/view/widgets/jobs_sliver_grid.dart';
import '../../providers/search_providers.dart';

class SearchJobsSliverGridConsumer extends ConsumerWidget {
  const SearchJobsSliverGridConsumer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filteredJobs = ref.watch(filteredSearchProvider);
    return filteredJobs.when(
      data:
          (jobs) =>
              jobs.isEmpty
                  ? SliverFillRemaining(
                    hasScrollBody: false,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Center(child: Image.asset(Assets.imagesNoResult)),
                    ),
                  )
                  : JobsSliverGrid(jobs: jobs),
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
