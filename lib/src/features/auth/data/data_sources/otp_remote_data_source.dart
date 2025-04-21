import 'package:email_otp/email_otp.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final otpRemoteDataSourceProvider = Provider<OtpRemoteDataSource>(
  (ref) => const OtpRemoteDataSource(),
);

class OtpRemoteDataSource {
  const OtpRemoteDataSource();

  Future<bool> sendOtp(String email) async {
    return await EmailOTP.sendOTP(email: email);
  }

  bool verifyOtp(String otp) {
    return EmailOTP.verifyOTP(otp: otp);
  }

  Future<void> resendOtp(String email) async {
    final bool isExpired = EmailOTP.isOtpExpired();
    if (isExpired) {
      await EmailOTP.sendOTP(email: email);
    }
  }
}
