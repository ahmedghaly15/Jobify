import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/widgets/custom_error_widget.dart';
import '../../../../home/presentation/providers/home_providers.dart';
import '../../../../home/presentation/view/widgets/jobs_empty_sliver.dart';
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
                  ? const JobsEmptySliver()
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
