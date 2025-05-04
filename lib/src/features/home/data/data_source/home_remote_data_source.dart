import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobify/src/core/supabase/supabase_request_result.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/models/job.dart';
import '../../../../core/utils/const_strings.dart';

final homeRemoteDataSourceProvider = Provider.autoDispose<HomeRemoteDataSource>(
  (ref) => HomeRemoteDataSource(ref.read(supabaseProvider)),
);

class HomeRemoteDataSource {
  final SupabaseClient _supabaseClient;

  HomeRemoteDataSource(this._supabaseClient);

  Future<List<Job>> fetchJobs() async {
    final jsonJobs = await _supabaseClient
        .from(ConstStrings.jobsTable)
        .select()
        .eq('user_id', Supabase.instance.client.auth.currentUser!.id);
    return jsonJobs.map((jsonJob) => Job.fromJson(jsonJob)).toList();
  }
}
