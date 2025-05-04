import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/models/job.dart';
import '../../../../core/supabase/supabase_request_result.dart';
import '../../../../core/utils/functions/execute_and_handle_errors.dart';
import '../data_source/add_job_remote_data_source.dart';

final addJobRepoProvider = Provider.autoDispose<AddJobRepo>(
  (ref) => AddJobRepo(ref.read(addJobRemoteDataSourceProvider)),
);

class AddJobRepo {
  final AddJobRemoteDataSource _remoteDataSource;

  AddJobRepo(this._remoteDataSource);

  Future<SupabaseRequestResult<void>> addJob(Job job) {
    return executeAndHandleErrors(
      () async => await _remoteDataSource.addJob(job),
    );
  }
}
