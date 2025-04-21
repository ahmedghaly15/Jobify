// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../data/repos/social_auth_repo.dart';

part 'social_auth_providers.g.dart';

@riverpod
class FacebookAuth extends _$FacebookAuth {
  @override
  AsyncValue<void>? build() {
    return null;
  }

  void signIn() async {
    state = const AsyncLoading();
    final result = await ref
        .read(socialAuthRepoProvider)
        .signInWithOAuth(OAuthProvider.facebook);
    result.when(
      success: (_) => state = const AsyncData(null),
      failure: (error) => state = AsyncError(error.message, StackTrace.current),
    );
  }
}
