import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/models/jobify_user.dart';
import '../models/auth_request_params.dart';

abstract class AuthRemoteDataSource {
  final GoTrueClient supabaseAuth;

  AuthRemoteDataSource(this.supabaseAuth);

  Future<JobifyUser> auth(AuthRequestParams params);
}
