import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/models/job.dart';
import '../../data/stats_repo.dart';

final statsProvider = FutureProvider.autoDispose.family<int, JobStatus>((
  ref,
  jobStatus,
) async {
  final matchesJobsCount = await ref
      .read(statsRepoProvider)
      .countJobStatus(jobStatus);

  return matchesJobsCount.when(
    success: (matchesCount) => matchesCount,
    failure: (failure) => throw failure.message,
  );
});
