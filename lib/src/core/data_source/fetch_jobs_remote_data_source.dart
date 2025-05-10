import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/fetch_jobs_response.dart';
import '../models/job.dart';
import '../supabase/supabase_request_result.dart';
import '../utils/const_strings.dart';
import '../utils/constants.dart';

final fetchJobsRemoteDataSourceProvider =
    Provider.autoDispose<FetchJobsRemoteDataSource>((ref) {
      return FetchJobsRemoteDataSource(ref.read(supabaseProvider));
    });

class FetchJobsRemoteDataSource {
  final SupabaseClient _supabaseClient;

  FetchJobsRemoteDataSource(this._supabaseClient);

  Future<List<Job>> fetchJobs() async {
    final data = await fetchRemoteJobsJson();
    final response = FetchJobsResponse.fromJson(data);
    return response.jobs;
  }

  Future<PostgrestMap> fetchRemoteJobsJson() async {
    return await _supabaseClient
        .from(ConstStrings.jobsTable)
        .select('jobs')
        .eq('user_id', currentUser!.user!.id)
        .single();
  }
}
