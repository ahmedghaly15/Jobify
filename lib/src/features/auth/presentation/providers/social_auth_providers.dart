// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repos/social_auth_repo.dart';

part 'social_auth_providers.g.dart';

@riverpod
class SocialOAuth extends _$SocialOAuth {
  late final ProviderListenable<SocialAuthRepo> _repoProvider;

  @override
  AsyncValue<void>? build(ProviderListenable<SocialAuthRepo> repoProvider) {
    _repoProvider = repoProvider;
    return null;
  }

  void signIn() async {
    state = const AsyncLoading();
    final result = await ref.read(_repoProvider).signIn();
    result.when(
      success: (_) => state = const AsyncData(null),
      failure: (error) => state = AsyncError(error.message, StackTrace.current),
    );
  }
}
