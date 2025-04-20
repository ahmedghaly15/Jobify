import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/models/jobify_user.dart';
import '../../data/repos/otp_repo.dart';

part 'otp_verification_provider.g.dart';

final pinputVerificationController = Provider.autoDispose(
  (ref) => TextEditingController(),
);

@riverpod
class OtpVerification extends _$OtpVerification {
  @override
  AsyncValue<JobifyUser>? build() {
    return null;
  }

  void verifyOtp() async {
    state = const AsyncValue.loading();
    final result = await ref
        .read(otpRepoProvider)
        .verifyOtp(ref.read(pinputVerificationController).text);
    result.when(
      success: (jobifyUser) => state = AsyncValue.data(jobifyUser),
      failure:
          (error) =>
              state = AsyncValue.error(error.message, StackTrace.current),
    );
  }
}
