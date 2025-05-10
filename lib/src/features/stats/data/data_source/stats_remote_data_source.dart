import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/data_source/fetch_jobs_remote_data_source.dart';
import '../../../../core/models/job.dart';

final statsRemoteDataSourceProvider = Provider<StatsRemoteDataSource>((ref) {
  return StatsRemoteDataSource(ref.read(fetchJobsRemoteDataSourceProvider));
});

final class StatsRemoteDataSource {
  final FetchJobsRemoteDataSource _remoteDataSource;

  StatsRemoteDataSource(this._remoteDataSource);

  Future<int> countMatchesJobs(JobStatus jobStatus) async {
    final jobs = await _remoteDataSource.fetchJobs();
    return jobs.where((job) => job.status == jobStatus).toList().length;
  }
}
