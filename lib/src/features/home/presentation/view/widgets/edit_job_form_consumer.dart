import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/field_validator.dart';
import '../../../../../core/models/job.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../add_job/presentation/view/widgets/job_mode_dropdown_consumer.dart';
import '../../../../add_job/presentation/view/widgets/job_status_dropdown_consumer.dart';
import '../../providers/home_providers.dart';

class EditJobFormConsumer extends ConsumerWidget {
  const EditJobFormConsumer({super.key, required this.job});

  final Job job;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final autovalidateMode = ref.watch(editJobAutovalidateModeProvider);
    final formKey = ref.watch(editJobFormKeyProvider);
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        spacing: 16.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextFormField(
            hintText: AppStrings.position,
            initialValue: job.position,
            validating: (value) => FieldValidator.validatingEmptyField(value),
            onChanged: (value) {
              ref.read(editJobPositionProvider(job.position!).notifier).state =
                  value;
            },
          ),
          CustomTextFormField(
            hintText: AppStrings.company,
            initialValue: job.company,
            validating: (value) => FieldValidator.validatingEmptyField(value),
            onChanged: (value) {
              ref.read(editJobCompanyProvider(job.company!).notifier).state =
                  value;
            },
          ),
          CustomTextFormField(
            hintText: AppStrings.location,
            initialValue: job.location,
            validating: (value) => FieldValidator.validatingEmptyField(value),
            onChanged: (value) {
              ref.read(editJobLocationProvider(job.location!).notifier).state =
                  value;
            },
          ),
          JobStatusDropdownConsumer(
            statusProvider: editJobStatusProvider(job.status!),
          ),
          JobModeDropdownConsumer(modeProvider: editJobModeProvider(job.mode!)),
        ],
      ),
    );
  }
}
