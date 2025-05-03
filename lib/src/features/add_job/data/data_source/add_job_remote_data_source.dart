import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/supabase/supabase_request_result.dart';
import '../../../../core/utils/const_strings.dart';
import '../../../../core/utils/constants.dart';
import '../models/add_job_request_body.dart';

final addJobRemoteDataSourceProvider =
    Provider.autoDispose<AddJobRemoteDataSource>(
      (ref) => AddJobRemoteDataSource(ref.read(supabaseProvider)),
    );

class AddJobRemoteDataSource {
  final SupabaseClient _supabaseClient;

  AddJobRemoteDataSource(this._supabaseClient);

  Future<void> addJob(AddJobRequestBody requestBody) async {
    final results = await _fetchJobs();
    if (results.isEmpty) {
      await _insertFirstJob(requestBody);
    } else {
      await _updateJobs(results, requestBody);
    }
  }

  Future<PostgrestList> _fetchJobs() async {
    return await _supabaseClient
        .from(ConstStrings.jobsTable)
        .select()
        .eq('user_id', currentUser!.user!.id);
  }

  Future<void> _updateJobs(
    PostgrestList results,
    AddJobRequestBody requestBody,
  ) async {
    final existingJobs = results.first['jobs'] as List<dynamic>? ?? [];
    existingJobs.add(requestBody.toJson());
    await _supabaseClient
        .from(ConstStrings.jobsTable)
        .update({'jobs': existingJobs})
        .eq('user_id', currentUser!.user!.id);
  }

  Future<void> _insertFirstJob(AddJobRequestBody requestBody) async {
    await _supabaseClient
        .from(ConstStrings.jobsTable)
        .insert({
          'user_id': currentUser!.user!.id,
          'jobs': [requestBody.toJson()],
        })
        .eq('user_id', currentUser!.user!.id);
  }
}
