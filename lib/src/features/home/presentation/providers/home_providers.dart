// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/models/job.dart';
import '../../../auth/presentation/providers/form_notifier_providers.dart';
import '../../data/repo/home_repo.dart';

part 'home_providers.g.dart';

final editJobAutovalidateModeProvider = StateNotifierProvider.autoDispose<
  AutovalidateModeNotifier,
  AutovalidateMode
>((ref) => AutovalidateModeNotifier());
final editJobFormKeyProvider = Provider.autoDispose<GlobalKey<FormState>>(
  (ref) => GlobalKey<FormState>(),
);
final editJobPositionControllerProvider = Provider.autoDispose
    .family<TextEditingController, String>(
      (ref, position) => TextEditingController(text: position),
    );
final editJobCompanyControllerProvider = Provider.autoDispose
    .family<TextEditingController, String>(
      (ref, company) => TextEditingController(text: company),
    );
final editJobLocationControllerProvider = Provider.autoDispose
    .family<TextEditingController, String>(
      (ref, location) => TextEditingController(text: location),
    );
final companyFocusNodeProvider = Provider.autoDispose<FocusNode>(
  (ref) => FocusNode(),
);
final locationFocusNodeProvider = Provider.autoDispose<FocusNode>(
  (ref) => FocusNode(),
);
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

@riverpod
class UpdateJob extends _$UpdateJob {
  @override
  AsyncValue<void>? build() {
    return null;
  }

  void _updateJob(Job job) async {
    state = const AsyncValue.loading();
    final newJob = job.copyWith(
      position: ref.read(editJobPositionControllerProvider(job.position!)).text,
      company: ref.read(editJobCompanyControllerProvider(job.company!)).text,
      location: ref.read(editJobLocationControllerProvider(job.location!)).text,
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
