import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobify/src/core/utils/enums.dart';

import '../../../../core/models/job.dart';
import '../../data/models/search_params.dart';
import '../../data/repo/search_repo.dart';


final filterStateProvider = StateProvider.autoDispose<SearchFilter>(
  (ref) => SearchFilter.all,
);

final filteredSearchProvider = FutureProvider.autoDispose
    <List<Job>>((
  ref,
) async {
      final searchRemoteResult = await ref
          .read(searchRepoProvider)
          .searchJobs(
            SearchParams(
          position: ref.watch(searchTextProvider),
              filter: ref.watch(filterStateProvider),
            ),
          );
      return searchRemoteResult.when(
        success: (result) => result,
        failure: (error) => throw error.message,
      );
    });

final searchTextProvider = StateProvider.autoDispose<String>((ref) => '');
