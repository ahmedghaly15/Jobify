import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/supabase/supabase_request_result.dart';
import '../../../../core/utils/functions/execute_and_handle_errors.dart';
import '../data_sources/social_auth_data_source.dart';

final facebookAuthRepoProvider = Provider<FacebookAuthRepo>(
  (ref) => FacebookAuthRepo(ref.read(facebookAuthDataSourceProvider)),
);

abstract class SocialAuthRepo {
  Future<SupabaseRequestResult<void>> signIn();
}

class FacebookAuthRepo extends SocialAuthRepo {
  final FacebookAuthDataSource _remoteDataSource;

  FacebookAuthRepo(this._remoteDataSource);

  @override
  Future<SupabaseRequestResult<void>> signIn() {
    return executeAndHandleErrors<void>(
      () async => await _remoteDataSource.signIn(),
    );
  }
}
