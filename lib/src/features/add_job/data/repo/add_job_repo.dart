import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/supabase/supabase_request_result.dart';
import '../../../../core/utils/functions/execute_and_handle_errors.dart';
import '../data_source/add_job_remote_data_source.dart';
import '../models/add_job_request_body.dart';

final addJobRepoProvider = Provider.autoDispose<AddJobRepo>(
  (ref) => AddJobRepo(ref.read(addJobRemoteDataSourceProvider)),
);

class AddJobRepo {
  final AddJobRemoteDataSource _remoteDataSource;

  AddJobRepo(this._remoteDataSource);

  Future<SupabaseRequestResult<void>> addJob(AddJobRequestBody requestBody) {
    return executeAndHandleErrors(
      () async => await _remoteDataSource.addJob(requestBody),
    );
  }
}
