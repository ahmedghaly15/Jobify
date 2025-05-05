import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobify/src/core/utils/enums.dart';

import '../../../../core/models/job.dart';
import '../../data/models/search_params.dart';
import '../../data/repo/search_repo.dart';

final searchControllerProvider = Provider.autoDispose<TextEditingController>(
  (ref) => TextEditingController(),
);
final filterStateProvider = StateProvider.autoDispose<SearchFilter>(
  (ref) => SearchFilter.all,
);

final filteredSearchProvider = FutureProvider.autoDispose
    .family<List<Job>, String>((ref, position) async {
      final searchRemoteResult = await ref
          .read(searchRepoProvider)
          .searchJobs(
            SearchParams(
              position: position,
              filter: ref.watch(filterStateProvider),
            ),
          );
      return searchRemoteResult.when(
        success: (result) => result,
        failure: (error) => throw error.message,
      );
    });
