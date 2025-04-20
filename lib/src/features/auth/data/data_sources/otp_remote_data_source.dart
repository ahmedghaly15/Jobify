import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/models/jobify_user.dart';
import '../../../../core/supabase/supabase_request_result.dart';
import '../../../../core/utils/constants.dart';

final otpRemoteDataSourceProvider = Provider<OtpRemoteDataSource>(
  (ref) => OtpRemoteDataSource(ref.read(supabaseAuthProvider)),
);

class OtpRemoteDataSource {
  final GoTrueClient _supabaseAuth;

  OtpRemoteDataSource(this._supabaseAuth);

  Future<JobifyUser> verifyOtp(String token) async {
    final authResponse = await _supabaseAuth.verifyOTP(
      token: token,
      type: OtpType.signup,
    );
    return JobifyUser(
      session: authResponse.session,
      user: authResponse.user,
      name: currentUser?.name,
    );
  }
}
