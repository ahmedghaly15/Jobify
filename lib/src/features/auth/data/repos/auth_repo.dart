import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/models/jobify_user.dart';
import '../../../../core/supabase/supabase_request_result.dart';
import '../../../../core/utils/functions/execute_and_handle_errors.dart';
import '../data_sources/auth_remote_data_source.dart';
import '../models/auth_request_params.dart';

abstract class AuthRepo {
  Future<SupabaseRequestResult<JobifyUser>> auth(AuthRequestParams params);
}

final registerRepoProvider = Provider<RegisterRepo>(
  (ref) => RegisterRepo(ref.read(registerRemoteDataSourceProvider)),
);

class RegisterRepo extends AuthRepo {
  final RegisterRemoteDataSource _remoteDataSource;

  RegisterRepo(this._remoteDataSource);

  @override
  Future<SupabaseRequestResult<JobifyUser>> auth(AuthRequestParams params) {
    return executeAndHandleErrors<JobifyUser>(
      () async => await _remoteDataSource.auth(params),
    );
  }
}

final loginRepoProvider = Provider<LoginRepo>(
  (ref) => LoginRepo(ref.read(loginRemoteDataSourceProvider)),
);

class LoginRepo extends AuthRepo {
  final LoginRemoteDataSource _remoteDataSource;

  LoginRepo(this._remoteDataSource);

  @override
  Future<SupabaseRequestResult<JobifyUser>> auth(AuthRequestParams params) {
    return executeAndHandleErrors<JobifyUser>(
      () async => await _remoteDataSource.auth(params),
    );
  }
}
