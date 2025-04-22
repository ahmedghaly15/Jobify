// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'social_auth_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$socialOAuthHash() => r'c1066d607c714073c561a6509e02778c1c76bc7a';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$SocialOAuth
    extends BuildlessAutoDisposeNotifier<AsyncValue<void>?> {
  late final ProviderListenable<SocialAuthRepo> repoProvider;

  AsyncValue<void>? build(ProviderListenable<SocialAuthRepo> repoProvider);
}

/// See also [SocialOAuth].
@ProviderFor(SocialOAuth)
const socialOAuthProvider = SocialOAuthFamily();

/// See also [SocialOAuth].
class SocialOAuthFamily extends Family<AsyncValue<void>?> {
  /// See also [SocialOAuth].
  const SocialOAuthFamily();

  /// See also [SocialOAuth].
  SocialOAuthProvider call(ProviderListenable<SocialAuthRepo> repoProvider) {
    return SocialOAuthProvider(repoProvider);
  }

  @override
  SocialOAuthProvider getProviderOverride(
    covariant SocialOAuthProvider provider,
  ) {
    return call(provider.repoProvider);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'socialOAuthProvider';
}

/// See also [SocialOAuth].
class SocialOAuthProvider
    extends AutoDisposeNotifierProviderImpl<SocialOAuth, AsyncValue<void>?> {
  /// See also [SocialOAuth].
  SocialOAuthProvider(ProviderListenable<SocialAuthRepo> repoProvider)
    : this._internal(
        () => SocialOAuth()..repoProvider = repoProvider,
        from: socialOAuthProvider,
        name: r'socialOAuthProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$socialOAuthHash,
        dependencies: SocialOAuthFamily._dependencies,
        allTransitiveDependencies: SocialOAuthFamily._allTransitiveDependencies,
        repoProvider: repoProvider,
      );

  SocialOAuthProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.repoProvider,
  }) : super.internal();

  final ProviderListenable<SocialAuthRepo> repoProvider;

  @override
  AsyncValue<void>? runNotifierBuild(covariant SocialOAuth notifier) {
    return notifier.build(repoProvider);
  }

  @override
  Override overrideWith(SocialOAuth Function() create) {
    return ProviderOverride(
      origin: this,
      override: SocialOAuthProvider._internal(
        () => create()..repoProvider = repoProvider,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        repoProvider: repoProvider,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<SocialOAuth, AsyncValue<void>?>
  createElement() {
    return _SocialOAuthProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SocialOAuthProvider && other.repoProvider == repoProvider;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, repoProvider.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SocialOAuthRef on AutoDisposeNotifierProviderRef<AsyncValue<void>?> {
  /// The parameter `repoProvider` of this provider.
  ProviderListenable<SocialAuthRepo> get repoProvider;
}

class _SocialOAuthProviderElement
    extends AutoDisposeNotifierProviderElement<SocialOAuth, AsyncValue<void>?>
    with SocialOAuthRef {
  _SocialOAuthProviderElement(super.provider);

  @override
  ProviderListenable<SocialAuthRepo> get repoProvider =>
      (origin as SocialOAuthProvider).repoProvider;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
