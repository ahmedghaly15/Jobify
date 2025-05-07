// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobify/src/core/utils/enums.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/models/job.dart';
import '../../data/models/search_params.dart';
import '../../data/repo/search_repo.dart';

part 'search_providers.g.dart';

final filterStateProvider = StateProvider.autoDispose<SearchFilter>(
  (ref) => SearchFilter.all,
);

final searchTextProvider = StateProvider.autoDispose<String>((ref) => '');

@riverpod
class FilteredSearch extends _$FilteredSearch {
  @override
  AsyncValue<List<Job>> build() {
    return const AsyncValue.data([]);
  }

  void fetchFilteredSearch() async {
    state = const AsyncValue.loading();
    final searchRemoteResult = await ref
        .read(searchRepoProvider)
        .searchJobs(
          SearchParams(
            position: ref.watch(searchTextProvider),
            filter: ref.watch(filterStateProvider),
          ),
        );
    searchRemoteResult.when(
      success: (result) => state = AsyncValue.data(result),
      failure:
          (error) =>
              state = AsyncValue.error(error.message, StackTrace.current),
    );
  }
}
