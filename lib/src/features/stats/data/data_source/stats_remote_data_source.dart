import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/models/job.dart';
import '../../../home/data/data_source/home_remote_data_source.dart';

final statsRemoteDataSourceProvider = Provider<StatsRemoteDataSource>((ref) {
  final homeRemoteDataSource = ref.watch(homeRemoteDataSourceProvider);
  return StatsRemoteDataSource(homeRemoteDataSource);
});

final class StatsRemoteDataSource {
  final HomeRemoteDataSource _homeRemoteDataSource;

  StatsRemoteDataSource(this._homeRemoteDataSource);

  Future<List<Job>> fetchMatchesJobs(JobStatus jobStatus) async {
    final jobs = await _homeRemoteDataSource.fetchJobs();
    return jobs.where((job) => job.status == jobStatus).toList();
  }
}
