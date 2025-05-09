import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/models/job.dart';
import '../../../../core/supabase/supabase_request_result.dart';
import '../../../../core/utils/functions/execute_and_handle_errors.dart';
import '../data_source/home_remote_data_source.dart';

final homeRepoProvider = Provider.autoDispose<HomeRepo>(
  (ref) => HomeRepo(ref.read(homeRemoteDataSourceProvider)),
);

class HomeRepo {
  final HomeRemoteDataSource _remoteDataSource;

  HomeRepo(this._remoteDataSource);

  Future<SupabaseRequestResult<List<Job>>> fetchJobs() {
    return executeAndHandleErrors<List<Job>>(
      () async => await _remoteDataSource.fetchJobs(),
    );
  }

  Future<SupabaseRequestResult<void>> updateJob(Job job) {
    return executeAndHandleErrors<void>(
      () async => await _remoteDataSource.updateJob(job),
    );
  }

  Future<SupabaseRequestResult<void>> deleteJob(int jobId) {
    return executeAndHandleErrors<void>(
      () async => await _remoteDataSource.deleteJob(jobId),
    );
  }
}
