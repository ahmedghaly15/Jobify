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
    final data = await _supabaseClient
        .from(ConstStrings.jobsTable)
        .select()
        .eq('user_id', Supabase.instance.client.auth.currentUser!.id);
    if (data.isEmpty || data.first['jobs'] == null) return [];
    final List<dynamic> jsonJobs = data.first['jobs'];
    return jsonJobs
        .map((jsonJob) => Job.fromJson(jsonJob as Map<String, dynamic>))
        .toList();
  }
}
