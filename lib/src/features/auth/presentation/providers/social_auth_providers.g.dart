// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'social_auth_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$facebookAuthHash() => r'e7b7e6e871f951cc9432713c6dd7abf34cec73df';

/// See also [FacebookAuth].
@ProviderFor(FacebookAuth)
final facebookAuthProvider =
    AutoDisposeNotifierProvider<FacebookAuth, AsyncValue<void>?>.internal(
      FacebookAuth.new,
      name: r'facebookAuthProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$facebookAuthHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$FacebookAuth = AutoDisposeNotifier<AsyncValue<void>?>;
String _$googleAuthHash() => r'392c632aa439b17cf45e7c94e22b32f33b535e6b';

/// See also [GoogleAuth].
@ProviderFor(GoogleAuth)
final googleAuthProvider =
    AutoDisposeNotifierProvider<GoogleAuth, AsyncValue<void>?>.internal(
      GoogleAuth.new,
      name: r'googleAuthProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$googleAuthHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$GoogleAuth = AutoDisposeNotifier<AsyncValue<void>?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
