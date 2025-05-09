import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/models/job.dart';
import 'edit_job_form_state.dart';

class EditJobFormNotifier extends StateNotifier<EditJobFormState> {
  final Job initialJob;

  EditJobFormNotifier(this.initialJob)
    : super(
        EditJobFormState(
          position: initialJob.position!,
          company: initialJob.company!,
          location: initialJob.location!,
          status: initialJob.status!,
          mode: initialJob.mode!,
        ),
      );

  void updatePosition(String value) {
    _update(state.copyWith(position: value));
  }

  void updateCompany(String value) {
    _update(state.copyWith(company: value));
  }

  void updateLocation(String value) {
    _update(state.copyWith(location: value));
  }

  void updateStatus(JobStatus value) {
    _update(state.copyWith(status: value));
  }

  void updateMode(JobMode value) {
    _update(state.copyWith(mode: value));
  }

  void _update(EditJobFormState newState) {
    final dirty =
        newState.position != initialJob.position ||
        newState.company != initialJob.company ||
        newState.location != initialJob.location ||
        newState.status != initialJob.status ||
        newState.mode != initialJob.mode;

    state = newState.copyWith(isDirty: dirty);
  }
}
