import '../../../../core/models/jobify_user.dart';
import '../../../../core/supabase/supabase_request_result.dart';
import '../../../../core/utils/functions/execute_and_handle_errors.dart';
import '../data_sources/register_remote_data_source.dart';
import '../models/auth_request_params.dart';
import 'auth_repo.dart';

class RegisterRepo extends AuthRepo {
  final RegisterRemoteDataSource _remoteDataSource;

  RegisterRepo(this._remoteDataSource) : super(_remoteDataSource);

  @override
  Future<SupabaseRequestResult<JobifyUser>> auth(AuthRequestParams params) {
    return executeAndHandleErrors<JobifyUser>(
      () async => await _remoteDataSource.auth(params),
    );
  }
}
