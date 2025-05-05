import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobify/src/core/helpers/extensions.dart';

import '../../../../core/models/job.dart';
import '../../../../core/utils/enums.dart';
import '../../../home/data/data_source/home_remote_data_source.dart';
import '../models/search_params.dart';

final searchDataSourceProvider = Provider.autoDispose<SearchDataSource>(
  (ref) => SearchDataSource(ref.read(homeRemoteDataSourceProvider)),
);

class SearchDataSource {
  final HomeRemoteDataSource _homeRemoteDataSource;

  SearchDataSource(this._homeRemoteDataSource);

  Future<List<Job>> searchJobs(SearchParams params) async {
    final jobs = await _homeRemoteDataSource.fetchJobs();
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
