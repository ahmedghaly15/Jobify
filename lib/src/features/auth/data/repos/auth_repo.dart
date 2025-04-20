import '../../../../core/models/jobify_user.dart';
import '../../../../core/supabase/supabase_request_result.dart';
import '../data_sources/auth_remote_data_source.dart';
import '../models/auth_request_params.dart';

abstract class AuthRepo {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepo(this.remoteDataSource);

  Future<SupabaseRequestResult<JobifyUser>> auth(AuthRequestParams params);
}
