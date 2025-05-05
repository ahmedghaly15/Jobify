// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/models/job.dart';
import '../../../../core/utils/enums.dart';
import '../../../auth/presentation/providers/form_notifier_providers.dart';
import '../../data/repo/add_job_repo.dart';

part 'add_job_provider.g.dart';

final addJobAutovalidateModeProvider = StateNotifierProvider.autoDispose<
  AutovalidateModeNotifier,
  AutovalidateMode
>((ref) => AutovalidateModeNotifier());
final addJobFormKeyProvider = Provider.autoDispose<GlobalKey<FormState>>(
  (ref) => GlobalKey<FormState>(),
);
final positionControllerProvider = Provider.autoDispose<TextEditingController>(
  (ref) => TextEditingController(),
);
final companyControllerProvider = Provider.autoDispose<TextEditingController>(
  (ref) => TextEditingController(),
);
final locationControllerProvider = Provider.autoDispose<TextEditingController>(
  (ref) => TextEditingController(),
);
final companyFocusNodeProvider = Provider.autoDispose<FocusNode>(
  (ref) => FocusNode(),
);
final locationFocusNodeProvider = Provider.autoDispose<FocusNode>(
  (ref) => FocusNode(),
);
final statusProvider = StateProvider.autoDispose<JobStatus>(
  (ref) => JobStatus.pending,
);
final modeProvider = StateProvider.autoDispose<JobMode>(
  (ref) => JobMode.fullTime,
);

@riverpod
class AddJob extends _$AddJob {
  @override
  AsyncValue<void>? build() {
    return null;
  }

  void _addJob() async {
    state = const AsyncValue.loading();
    final result = await ref
        .read(addJobRepoProvider)
        .addJob(
          Job(
            position: ref.read(positionControllerProvider).text,
            company: ref.read(companyControllerProvider).text,
            location: ref.read(locationControllerProvider).text,
            status: ref.read(statusProvider),
            mode: ref.read(modeProvider),
            createdAt: DateTime.now().toIso8601String(),
          ),
        );
    result.when(
      success: (data) => state = const AsyncValue.data(null),
      failure:
          (error) =>
              state = AsyncValue.error(error.message, StackTrace.current),
    );
  }

  void validateAndAddJob() {
    if (ref.read(addJobFormKeyProvider).currentState!.validate()) {
      _addJob();
    } else {
      ref.read(addJobAutovalidateModeProvider.notifier).enableAutoValidate();
    }
  }
}
