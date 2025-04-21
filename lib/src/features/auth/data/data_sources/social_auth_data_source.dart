import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/supabase/supabase_request_result.dart';

final socialAuthDataSourceProvider = Provider<SocialAuthDataSource>(
  (ref) => SocialAuthDataSource(ref.read(supabaseAuthProvider)),
);

class SocialAuthDataSource {
  final GoTrueClient _supabaseAuth;
  SocialAuthDataSource(this._supabaseAuth);

  Future<void> signInWithOAuth(OAuthProvider authProvider) async {
    await _supabaseAuth.signInWithOAuth(
      authProvider,
      authScreenLaunchMode: LaunchMode.inAppBrowserView,
    );
  }
}
