import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/models/jobify_user.dart';
import '../../../../core/supabase/supabase_request_result.dart';
import '../models/auth_request_params.dart';
import 'auth_remote_data_source.dart';

final registerRemoteDataSourceProvider = Provider<RegisterRemoteDataSource>(
  (ref) => RegisterRemoteDataSource(ref.read(supabaseAuthProvider)),
);

class RegisterRemoteDataSource extends AuthRemoteDataSource {
  final GoTrueClient _supabaseAuth;

  RegisterRemoteDataSource(this._supabaseAuth) : super(_supabaseAuth);

  @override
  Future<JobifyUser> auth(AuthRequestParams params) async {
    final authResponse = await _supabaseAuth.signUp(
      email: params.email,
      password: params.password,
      data: {'name': params.name, 'createdAt': TimeOfDay.now().toString()},
    );
    return JobifyUser(
      session: authResponse.session,
      user: authResponse.user,
      name: params.name,
    );
  }
}
