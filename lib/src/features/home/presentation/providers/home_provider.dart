import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/models/job.dart';
import '../../data/repo/home_repo.dart';

final fetchJobsProvider = FutureProvider.autoDispose<List<Job>>((ref) async {
  final homeRepo = ref.watch(homeRepoProvider);
  final result = await homeRepo.fetchJobs();
  return result.when(
    success: (jobs) => jobs,
    failure: (error) => throw error.message,
  );
});
