import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/supabase/supabase_request_result.dart';
import '../../../../core/utils/const_strings.dart';
import '../models/add_job_request_body.dart';

final addJobRemoteDataSourceProvider =
    Provider.autoDispose<AddJobRemoteDataSource>(
      (ref) => AddJobRemoteDataSource(ref.read(supabaseProvider)),
    );

class AddJobRemoteDataSource {
  final SupabaseClient _supabaseClient;

  AddJobRemoteDataSource(this._supabaseClient);

  Future<void> addJob(AddJobRequestBody requestBody) async {
    await _supabaseClient
        .from(ConstStrings.jobsTable)
        .insert(requestBody.toJson());
  }
}
