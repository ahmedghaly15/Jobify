import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/models/job.dart';
import '../../../core/supabase/supabase_request_result.dart';
import '../../../core/utils/functions/execute_and_handle_errors.dart';
import 'data_source/stats_remote_data_source.dart';

final statsRepoProvider = Provider<StatsRepo>((ref) {
  final statsRemoteDataSource = ref.watch(statsRemoteDataSourceProvider);
  return StatsRepo(statsRemoteDataSource);
});

class StatsRepo {
  final StatsRemoteDataSource _remoteDataSource;

  StatsRepo(this._remoteDataSource);

  Future<SupabaseRequestResult<int>> countJobStatus(JobStatus jobStatus) {
    return executeAndHandleErrors<int>(
      () async => await _remoteDataSource.countMatchesJobs(jobStatus),
    );
  }
}
