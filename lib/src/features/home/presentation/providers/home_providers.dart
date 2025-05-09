// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/models/job.dart';
import '../../../auth/presentation/providers/form_notifier_providers.dart';
import '../../data/repo/home_repo.dart';

part 'home_providers.g.dart';

final editJobFormKeyProvider = Provider.autoDispose<GlobalKey<FormState>>(
  (ref) => GlobalKey<FormState>(),
);
final editJobAutovalidateModeProvider = StateNotifierProvider.autoDispose<
  AutovalidateModeNotifier,
  AutovalidateMode
>((ref) => AutovalidateModeNotifier());
final editJobPositionProvider = StateProvider.autoDispose
    .family<String, String>((ref, position) => position);
final editJobCompanyProvider = StateProvider.autoDispose.family<String, String>(
  (ref, company) => company,
);
final editJobLocationProvider = StateProvider.autoDispose
    .family<String, String>((ref, location) => location);
final editJobStatusProvider = StateProvider.autoDispose
    .family<JobStatus, JobStatus>((ref, jobStatus) => jobStatus);
final editJobModeProvider = StateProvider.autoDispose.family<JobMode, JobMode>(
  (ref, jobMode) => jobMode,
);

final fetchJobsProvider = FutureProvider.autoDispose<List<Job>>((ref) async {
  final homeRepo = ref.watch(homeRepoProvider);
  final result = await homeRepo.fetchJobs();
  return result.when(
    success: (jobs) => jobs,
    failure: (error) => throw error.message,
  );
});

final isEditJobButtonEnabledProvider = StateProvider.autoDispose
    .family<bool, Job>((ref, job) {
      final position = ref.watch(editJobPositionProvider(job.position!));
      final company = ref.watch(editJobCompanyProvider(job.company!));
      final location = ref.watch(editJobLocationProvider(job.location!));
      final status = ref.watch(editJobStatusProvider(job.status!));
      final mode = ref.watch(editJobModeProvider(job.mode!));
      return position != job.position ||
          company != job.company ||
          location != job.location ||
          status != job.status ||
          mode != job.mode;
    });

@riverpod
class UpdateJob extends _$UpdateJob {
  @override
  AsyncValue<void>? build() {
    return null;
  }

  void _updateJob(Job job) async {
    state = const AsyncValue.loading();
    final newJob = job.copyWith(
      position: ref.read(editJobPositionProvider(job.position!)),
      company: ref.read(editJobCompanyProvider(job.company!)),
      location: ref.read(editJobLocationProvider(job.location!)),
      mode: ref.read(editJobModeProvider(job.mode!)),
      status: ref.read(editJobStatusProvider(job.status!)),
    );
    final result = await ref.read(homeRepoProvider).updateJob(newJob);
    result.when(
      success: (_) => state = const AsyncValue.data(null),
      failure:
          (error) =>
              state = AsyncValue.error(error.message, StackTrace.current),
    );
  }

  void validateFormAndUpdateJob(Job job) {
    final formKey = ref.read(editJobFormKeyProvider);
    if (formKey.currentState!.validate()) {
      _updateJob(job);
    } else {
      ref.read(editJobAutovalidateModeProvider.notifier).enableAutoValidate();
    }
  }
}

@riverpod
class DeleteJob extends _$DeleteJob {
  @override
  AsyncValue<void>? build() {
    return null;
  }

  void deleteJob(int jobId) async {
    state = const AsyncValue.loading();
    final result = await ref.read(homeRepoProvider).deleteJob(jobId);
    result.when(
      success: (_) => state = const AsyncValue.data(null),
      failure:
          (error) =>
              state = AsyncValue.error(error.message, StackTrace.current),
    );
  }
}
