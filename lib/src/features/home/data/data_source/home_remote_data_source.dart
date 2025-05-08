import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobify/src/core/supabase/supabase_request_result.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/models/fetch_jobs_response.dart';
import '../../../../core/models/job.dart';
import '../../../../core/utils/const_strings.dart';
import '../../../../core/utils/constants.dart';

final homeRemoteDataSourceProvider = Provider.autoDispose<HomeRemoteDataSource>(
  (ref) => HomeRemoteDataSource(ref.read(supabaseProvider)),
);

class HomeRemoteDataSource {
  final SupabaseClient _supabaseClient;

  HomeRemoteDataSource(this._supabaseClient);

  Future<List<Job>> fetchJobs() async {
    final data = await _fetchRemoteJobsJson();
    final response = FetchJobsResponse.fromJson(data);
    return response.jobs;
  }

  Future<PostgrestMap> _fetchRemoteJobsJson() async {
    return await _supabaseClient
        .from(ConstStrings.jobsTable)
        .select('jobs')
        .eq('user_id', currentUser!.user!.id)
        .single();
  }

  Future<void> updateJob(Job job) async {
    final data = await _fetchRemoteJobsJson();
    if (data['jobs'] == null) return;

    final jsonJobs = List.from(data['jobs']);
    final jobIndex = jsonJobs.indexWhere((jsonJob) => jsonJob['id'] == job.id);

    if (jobIndex == -1) return; // job not found

    // Update job field
    jsonJobs[jobIndex] = {...jsonJobs[jobIndex], ...job.toJson()};

    // Update remote job
    await _supabaseClient
        .from(ConstStrings.jobsTable)
        .update({'jobs': jsonJobs})
        .eq('user_id', currentUser!.user!.id);
  }
}
