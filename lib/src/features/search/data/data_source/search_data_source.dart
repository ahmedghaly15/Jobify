import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobify/src/core/helpers/extensions.dart';

import '../../../../core/data_source/fetch_jobs_remote_data_source.dart';
import '../../../../core/models/job.dart';
import '../../../../core/utils/enums.dart';
import '../models/search_params.dart';

final searchDataSourceProvider = Provider.autoDispose<SearchDataSource>(
  (ref) => SearchDataSource(ref.read(fetchJobsRemoteDataSourceProvider)),
);

class SearchDataSource {
  final FetchJobsRemoteDataSource _remoteDataSource;

  SearchDataSource(this._remoteDataSource);

  Future<List<Job>> searchJobs(SearchParams params) async {
    final jobs = await _remoteDataSource.fetchJobs();
    return jobs.where((job) {
      final matchesStatus =
          params.filter == SearchFilter.all ||
          job.status == params.filter.toJobStatus();
      final matchesPosition =
          job.position?.toLowerCase().contains(params.position.toLowerCase()) ??
          false;
      return matchesStatus && matchesPosition;
    }).toList();
  }
}
