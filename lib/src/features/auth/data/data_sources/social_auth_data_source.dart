import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/supabase/supabase_request_result.dart';
import '../../../../core/utils/const_strings.dart';

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

final linkedinAuthDataSourceProvider = Provider<LinkedInAuthDataSource>(
  (ref) => LinkedInAuthDataSource(ref.read(supabaseAuthProvider)),
);

class LinkedInAuthDataSource extends SocialAuthDataSource {
  final GoTrueClient _supabaseAuth;
  LinkedInAuthDataSource(this._supabaseAuth);

  @override
  Future<void> signIn() async {
    await _supabaseAuth.signInWithOAuth(
      OAuthProvider.linkedin,
      authScreenLaunchMode: LaunchMode.inAppBrowserView,
    );
  }
}

final googleAuthDataSourceProvider = Provider<GoogleAuthDataSource>(
  (ref) => GoogleAuthDataSource(ref.read(supabaseAuthProvider)),
);

class GoogleAuthDataSource extends SocialAuthDataSource {
  final GoTrueClient _supabaseAuth;
  GoogleAuthDataSource(this._supabaseAuth);

  @override
  Future<void> signIn() async {
    if (!kIsWeb && (Platform.isIOS || Platform.isAndroid)) {
      await _nativeGoogleSignIn();
    }
  }

  Future<void> _nativeGoogleSignIn() async {
    final GoogleSignIn googleSignIn = GoogleSignIn(
      clientId: dotenv.env[ConstStrings.googleIosClientId],
      serverClientId: dotenv.env[ConstStrings.googleWebClientId],
    );

    final googleUser = await googleSignIn.signIn();
    final googleAuth = await googleUser!.authentication;
    final accessToken = googleAuth.accessToken;
    final idToken = googleAuth.idToken;

    if (accessToken == null) {
      throw 'No Access Token found.';
    }
    if (idToken == null) {
      throw 'No ID Token found.';
    }
    await _supabaseAuth.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: idToken,
      accessToken: accessToken,
    );
  }
}
