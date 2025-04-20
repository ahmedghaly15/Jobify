// import 'package:flutter_riverpod/flutter_riverpod.dart';

// import '../../../../core/models/jobify_user.dart';
// import '../../../../core/supabase/supabase_request_result.dart';
// import '../../../../core/utils/functions/execute_and_handle_errors.dart';
// import '../data_sources/otp_remote_data_source.dart';

// final otpRepoProvider = Provider<OtpRepo>(
//   (ref) => OtpRepo(ref.read(otpRemoteDataSourceProvider)),
// );

// class OtpRepo {
//   final OtpRemoteDataSource _remoteDataSource;
//   OtpRepo(this._remoteDataSource);

//   Future<SupabaseRequestResult<void>> sendOtp(String email) async {
//     return executeAndHandleErrors<void>(
//       () async => await _remoteDataSource.sendOtp(email),
//     );
//   }

//   Future<SupabaseRequestResult<JobifyUser>> verifyOtp(String token) async {
//     return executeAndHandleErrors<JobifyUser>(
//       () async => await _remoteDataSource.verifyOtp(token),
//     );
//   }

//   Future<SupabaseRequestResult<void>> resendOtp(String email) async {
//     return executeAndHandleErrors<void>(
//       () async => await _remoteDataSource.resendOtp(email),
//     );
//   }
// }
