import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobify/src/core/helpers/extensions.dart';

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
    final positionController = ref.watch(
      editJobPositionControllerProvider(job.position!),
    );
    final companyController = ref.watch(
      editJobCompanyControllerProvider(job.company!),
    );
    final locationController = ref.watch(
      editJobLocationControllerProvider(job.location!),
    );
    final companyFocusNode = ref.watch(companyFocusNodeProvider);
    final locationFocusNode = ref.watch(locationFocusNodeProvider);
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        spacing: 16.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextFormField(
            controller: positionController,
            hintText: AppStrings.position,
            validating: (value) => FieldValidator.validatingEmptyField(value),
          ),
          CustomTextFormField(
            controller: companyController,
            hintText: AppStrings.company,
            focusNode: companyFocusNode,
            validating: (value) => FieldValidator.validatingEmptyField(value),
            onEditingComplete: () => context.requestFocus(locationFocusNode),
          ),
          CustomTextFormField(
            controller: locationController,
            focusNode: locationFocusNode,
            hintText: AppStrings.location,
            validating: (value) => FieldValidator.validatingEmptyField(value),
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
