import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/supabase/supabase_error_handler.dart';
import '../../../../core/supabase/supabase_request_result.dart';
import '../../../../core/utils/functions/execute_and_handle_errors.dart';
import '../data_sources/otp_remote_data_source.dart';

final otpRepoProvider = Provider<OtpRepo>(
  (ref) => OtpRepo(ref.read(otpRemoteDataSourceProvider)),
);

class OtpRepo {
  final OtpRemoteDataSource _remoteDataSource;
  OtpRepo(this._remoteDataSource);

  Future<SupabaseRequestResult<bool>> sendOtp(String email) async {
    return executeAndHandleErrors<bool>(
      () async => await _remoteDataSource.sendOtp(email),
    );
  }

  SupabaseRequestResult<bool> verifyOtp(String token) {
    try {
      return SupabaseRequestResult<bool>.success(
        _remoteDataSource.verifyOtp(token),
      );
    } catch (e) {
      return SupabaseRequestResult.failure(
        SupabaseErrorHandler.handleError(e.toString()),
      );
    }
  }

  Future<SupabaseRequestResult<bool>> resendOtp(String email) async {
    return executeAndHandleErrors<bool>(
      () async => await _remoteDataSource.resendOtp(email),
    );
  }
}
