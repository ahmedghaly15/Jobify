import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/data_source/fetch_jobs_remote_data_source.dart';
import '../../../../core/models/job.dart';
import '../../../../core/supabase/supabase_request_result.dart';
import '../../../../core/utils/functions/execute_and_handle_errors.dart';
import '../data_source/home_remote_data_source.dart';

final homeRepoProvider = Provider.autoDispose<HomeRepo>((ref) {
  final fetchJobsRemoteDataSource = ref.read(fetchJobsRemoteDataSourceProvider);
  final homeRemoteDataSource = ref.read(homeRemoteDataSourceProvider);
  return HomeRepo(homeRemoteDataSource, fetchJobsRemoteDataSource);
});

class HomeRepo {
  final HomeRemoteDataSource _homeRemoteDataSource;
  final FetchJobsRemoteDataSource _fetchJobsRemoteDataSource;

  HomeRepo(this._homeRemoteDataSource, this._fetchJobsRemoteDataSource);

  Future<SupabaseRequestResult<List<Job>>> fetchJobs() {
    return executeAndHandleErrors<List<Job>>(
      () async => await _fetchJobsRemoteDataSource.fetchJobs(),
    );
  }

  Future<SupabaseRequestResult<void>> updateJob(Job job) {
    return executeAndHandleErrors<void>(
      () async => await _homeRemoteDataSource.updateJob(job),
    );
  }

  Future<SupabaseRequestResult<void>> deleteJob(int jobId) {
    return executeAndHandleErrors<void>(
      () async => await _homeRemoteDataSource.deleteJob(jobId),
    );
  }
}
