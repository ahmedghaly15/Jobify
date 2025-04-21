// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_verification_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$otpVerificationHash() => r'e156c70f2b1ec2aed86082b1ef2640e1cf7f6faa';

/// See also [OtpVerification].
@ProviderFor(OtpVerification)
final otpVerificationProvider =
    AutoDisposeNotifierProvider<OtpVerification, AsyncValue<bool>?>.internal(
      OtpVerification.new,
      name: r'otpVerificationProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$otpVerificationHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$OtpVerification = AutoDisposeNotifier<AsyncValue<bool>?>;
String _$sendOtpHash() => r'cd7a06d81494166a7df6ab5cea7fb4991256f429';

/// See also [SendOtp].
@ProviderFor(SendOtp)
final sendOtpProvider =
    AutoDisposeNotifierProvider<SendOtp, AsyncValue<bool>?>.internal(
      SendOtp.new,
      name: r'sendOtpProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product') ? null : _$sendOtpHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$SendOtp = AutoDisposeNotifier<AsyncValue<bool>?>;
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
