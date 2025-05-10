import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/widgets/custom_error_widget.dart';
import '../../providers/home_providers.dart';
import 'jobs_empty_sliver.dart';
import 'jobs_loading_sliver.dart';
import 'jobs_sliver_grid.dart';

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
                  : JobsSliverGrid(jobs: jobs),
      error:
          (error, _) => SliverFillRemaining(
            hasScrollBody: false,
            child: CustomErrorWidget(
              error: error.toString(),
              onPressed: () => ref.refresh(fetchJobsProvider.future),
            ),
          ),
      loading: () => const JobsLoadingSliver(),
    );
  }
}
