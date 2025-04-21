import '../../../../core/models/jobify_user.dart';
import '../models/auth_request_params.dart';

abstract class AuthRemoteDataSource {
  Future<JobifyUser> auth(AuthRequestParams params);
}
