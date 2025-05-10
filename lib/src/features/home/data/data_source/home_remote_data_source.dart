import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobify/src/core/supabase/supabase_request_result.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/data_source/fetch_jobs_remote_data_source.dart';
import '../../../../core/models/job.dart';
import '../../../../core/utils/const_strings.dart';
import '../../../../core/utils/constants.dart';

final homeRemoteDataSourceProvider = Provider.autoDispose<HomeRemoteDataSource>(
  (ref) {
    final supabaseClient = ref.read(supabaseProvider);
    final fetchJobsRemoteDataSource = ref.read(
      fetchJobsRemoteDataSourceProvider,
    );
    return HomeRemoteDataSource(fetchJobsRemoteDataSource, supabaseClient);
  },
);

class HomeRemoteDataSource {
  final FetchJobsRemoteDataSource _remoteDataSource;
  final SupabaseClient _supabaseClient;

  HomeRemoteDataSource(this._remoteDataSource, this._supabaseClient);

  Future<void> updateJob(Job job) async {
    final data = await _remoteDataSource.fetchRemoteJobsJson();
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

  Future<void> deleteJob(int jobId) async {
    final data = await _remoteDataSource.fetchRemoteJobsJson();
    if (data['jobs'] == null) return;

    final jsonJobs = List.from(data['jobs']);
    final jobIndex = jsonJobs.indexWhere((jsonJob) => jsonJob['id'] == jobId);

    if (jobIndex == -1) return; // job not found

    // Remove job from list
    jsonJobs.removeAt(jobIndex);

    // Update remote jobs
    await _supabaseClient
        .from(ConstStrings.jobsTable)
        .update({'jobs': jsonJobs})
        .eq('user_id', currentUser!.user!.id);
  }
}
