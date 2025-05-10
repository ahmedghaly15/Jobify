import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/supabase/supabase_request_result.dart';
import '../models/update_profile_params.dart';

final profileRemoteDataSourceProvider =
    Provider.autoDispose<ProfileRemoteDataSource>((ref) {
      return ProfileRemoteDataSource(ref.read(supabaseProvider));
    });

class ProfileRemoteDataSource {
  final SupabaseClient _supabaseClient;

  ProfileRemoteDataSource(this._supabaseClient);

  Future<void> updateProfile(UpdateProfileParams params) async {
    await _supabaseClient.auth.updateUser(
      UserAttributes(
        email: params.email,
        phone: params.phone,
        password: params.password,
        data: params.data,
      ),
    );
  }
}
