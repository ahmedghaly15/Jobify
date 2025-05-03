// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/models/add_job_request_body.dart';
import '../../data/repo/add_job_repo.dart';

part 'add_job_provider.g.dart';

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
          AddJobRequestBody(
            position: ref.read(positionControllerProvider).text,
            company: ref.read(companyControllerProvider).text,
            location: ref.read(locationControllerProvider).text,
            // TODO: handle this
            status: 'ref.read(statusControllerProvider).text',
            mode: 'ref.read(modeControllerProvider).text',
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
    }
  }
}
