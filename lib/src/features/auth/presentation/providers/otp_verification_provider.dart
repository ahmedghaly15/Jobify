// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repos/otp_repo.dart';

part 'otp_verification_provider.g.dart';

final pinputVerificationController = Provider.autoDispose(
  (ref) => TextEditingController(),
);

@riverpod
class OtpVerification extends _$OtpVerification {
  @override
  AsyncValue<bool>? build() {
    return null;
  }

  void verifyOtp() async {
    state = const AsyncValue.loading();
    await Future.delayed(const Duration(seconds: 3));
    final result = ref
        .read(otpRepoProvider)
        .verifyOtp(ref.read(pinputVerificationController).text);
    result.when(
      success: (verified) => state = AsyncValue.data(verified),
      failure:
          (error) =>
              state = AsyncValue.error(error.message, StackTrace.current),
    );
  }
}

@riverpod
class SendOtp extends _$SendOtp {
  @override
  AsyncValue<bool>? build() {
    return null;
  }

  void sendOtp(String email) async {
    state = const AsyncValue.loading();
    final result = await ref.read(otpRepoProvider).sendOtp(email);
    result.when(
      success: (emailSent) => state = AsyncValue.data(emailSent),
      failure:
          (error) =>
              state = AsyncValue.error(error.message, StackTrace.current),
    );
  }
}

@riverpod
class ResendOtp extends _$ResendOtp {
  @override
  AsyncValue<bool>? build() {
    return null;
  }

  void resendOtp(String email) async {
    state = const AsyncValue.loading();
    final result = await ref.read(otpRepoProvider).resendOtp(email);
    result.when(
      success: (otpResent) => state = AsyncValue.data(otpResent),
      failure:
          (error) =>
              state = AsyncValue.error(error.message, StackTrace.current),
    );
  }
}
