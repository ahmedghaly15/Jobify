// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_verification_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$otpVerificationHash() => r'c250133aca853da8acf028a3cd0050e4bd58119f';

/// See also [OtpVerification].
@ProviderFor(OtpVerification)
final otpVerificationProvider = AutoDisposeNotifierProvider<
  OtpVerification,
  AsyncValue<JobifyUser?>?
>.internal(
  OtpVerification.new,
  name: r'otpVerificationProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$otpVerificationHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$OtpVerification = AutoDisposeNotifier<AsyncValue<JobifyUser?>?>;
String _$sendOtpHash() => r'90e68af1654dfb560394b5166c7099c852cd6bfb';

/// See also [SendOtp].
@ProviderFor(SendOtp)
final sendOtpProvider =
    AutoDisposeNotifierProvider<SendOtp, AsyncValue<void>?>.internal(
      SendOtp.new,
      name: r'sendOtpProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product') ? null : _$sendOtpHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$SendOtp = AutoDisposeNotifier<AsyncValue<void>?>;
String _$resendOtpHash() => r'07d24f18059bec68142296167b93d85504631e68';

/// See also [ResendOtp].
@ProviderFor(ResendOtp)
final resendOtpProvider =
    AutoDisposeNotifierProvider<ResendOtp, AsyncValue<void>?>.internal(
      ResendOtp.new,
      name: r'resendOtpProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$resendOtpHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$ResendOtp = AutoDisposeNotifier<AsyncValue<void>?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
