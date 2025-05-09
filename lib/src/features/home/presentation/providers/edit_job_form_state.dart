import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/models/job.dart';

part 'edit_job_form_state.freezed.dart';

@freezed
class EditJobFormState with _$EditJobFormState {
  const factory EditJobFormState({
    required String position,
    required String company,
    required String location,
    required JobStatus status,
    required JobMode mode,
    @Default(false) bool isDirty,
  }) = _EditJobFormState;
}
