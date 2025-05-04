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
    return executeAndHandleErrors(
      () async => await _remoteDataSource.fetchJobs(),
    );
  }
}
