import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/utils/const_strings.dart';
import '../models/add_job_request_body.dart';

class AddJobRemoteDataSource {
  final SupabaseClient _supabaseClient;

  AddJobRemoteDataSource(this._supabaseClient);

  Future<void> addJob(AddJobRequestBody requestBody) async {
    await _supabaseClient
        .from(ConstStrings.jobsTable)
        .insert(requestBody.toJson());
  }
}
