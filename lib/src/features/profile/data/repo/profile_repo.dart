import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/models/jobify_user.dart';
import '../../../../core/supabase/supabase_request_result.dart';
import '../../../../core/utils/functions/execute_and_handle_errors.dart';
import '../data_source/profile_remote_data_source.dart';
import '../models/update_profile_params.dart';

final profileRepoProvider = Provider.autoDispose<ProfileRepo>(
  (ref) => ProfileRepo(ref.read(profileRemoteDataSourceProvider)),
);

class ProfileRepo {
  final ProfileRemoteDataSource _remoteDataSource;

  ProfileRepo(this._remoteDataSource);

  Future<SupabaseRequestResult<JobifyUser>> updateProfile(
    UpdateProfileParams params,
  ) {
    return executeAndHandleErrors<JobifyUser>(
      () async => await _remoteDataSource.updateProfile(params),
    );
  }
}
