import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/supabase/supabase_request_result.dart';

final facebookAuthDataSourceProvider = Provider<FacebookAuthDataSource>(
  (ref) => FacebookAuthDataSource(ref.read(supabaseAuthProvider)),
);

abstract class SocialAuthDataSource {
  Future<void> signIn();
}

class FacebookAuthDataSource extends SocialAuthDataSource {
  final GoTrueClient _supabaseAuth;
  FacebookAuthDataSource(this._supabaseAuth);

  @override
  Future<void> signIn() async {
    await _supabaseAuth.signInWithOAuth(
      OAuthProvider.facebook,
      authScreenLaunchMode: LaunchMode.inAppBrowserView,
    );
  }
}
