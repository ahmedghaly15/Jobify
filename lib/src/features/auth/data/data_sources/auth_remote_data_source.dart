import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/models/jobify_user.dart';
import '../../../../core/supabase/supabase_request_result.dart';
import '../models/auth_request_params.dart';

abstract class AuthRemoteDataSource {
  Future<JobifyUser> auth(AuthRequestParams params);
}

final registerRemoteDataSourceProvider = Provider<RegisterRemoteDataSource>(
  (ref) => RegisterRemoteDataSource(ref.read(supabaseAuthProvider)),
);

class RegisterRemoteDataSource extends AuthRemoteDataSource {
  final GoTrueClient _supabaseAuth;

  RegisterRemoteDataSource(this._supabaseAuth);

  @override
  Future<JobifyUser> auth(AuthRequestParams params) async {
    final authResponse = await _supabaseAuth.signUp(
      email: params.email,
      password: params.password,
      data: {'name': params.name},
    );
    return JobifyUser(
      session: authResponse.session,
      user: authResponse.user,
      name: params.name,
    );
  }
}

final loginRemoteDataSourceProvider = Provider<LoginRemoteDataSource>(
  (ref) => LoginRemoteDataSource(ref.read(supabaseAuthProvider)),
);

class LoginRemoteDataSource extends AuthRemoteDataSource {
  final GoTrueClient _supabaseAuth;

  LoginRemoteDataSource(this._supabaseAuth);

  @override
  Future<JobifyUser> auth(AuthRequestParams params) async {
    final authResponse = await _supabaseAuth.signInWithPassword(
      email: params.email,
      password: params.password,
    );
    return JobifyUser(session: authResponse.session, user: authResponse.user);
  }
}
