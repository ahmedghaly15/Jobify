import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/supabase/supabase_request_result.dart';
import '../../../../core/utils/functions/execute_and_handle_errors.dart';
import '../data_sources/social_auth_data_source.dart';

final socialAuthRepoProvider = Provider<SocialAuthRepo>(
  (ref) => SocialAuthRepo(ref.read(socialAuthDataSourceProvider)),
);

class SocialAuthRepo {
  final SocialAuthDataSource _remoteDataSource;

  SocialAuthRepo(this._remoteDataSource);

  Future<SupabaseRequestResult<void>> signInWithOAuth(OAuthProvider provider) {
    return executeAndHandleErrors<void>(
      () async => await _remoteDataSource.signInWithOAuth(provider),
    );
  }
}
