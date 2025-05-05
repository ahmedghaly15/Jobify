import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/models/job.dart';
import '../../../../core/supabase/supabase_request_result.dart';
import '../../../../core/utils/functions/execute_and_handle_errors.dart';
import '../data_source/search_data_source.dart';
import '../models/search_params.dart';

final searchRepoProvider = Provider.autoDispose<SearchRepo>(
  (ref) => SearchRepo(ref.read(searchDataSourceProvider)),
);

class SearchRepo {
  final SearchDataSource _dataSource;

  SearchRepo(this._dataSource);

  Future<SupabaseRequestResult<List<Job>>> searchJobs(SearchParams params) {
    return executeAndHandleErrors(
      () async => await _dataSource.searchJobs(params),
    );
  }
}
