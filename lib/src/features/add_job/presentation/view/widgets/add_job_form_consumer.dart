import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobify/src/core/helpers/extensions.dart';

import '../../../../../core/helpers/field_validator.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../providers/add_job_provider.dart';
import 'job_mode_dropdown_consumer.dart';
import 'job_status_dropdown_consumer.dart';

class AddJobFormConsumer extends ConsumerWidget {
  const AddJobFormConsumer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final autovalidateMode = ref.watch(addJobAutovalidateModeProvider);
    final formKey = ref.watch(addJobFormKeyProvider);
    final positionController = ref.watch(positionControllerProvider);
    final companyController = ref.watch(companyControllerProvider);
    final locationController = ref.watch(locationControllerProvider);
    final companyFocusNode = ref.watch(companyFocusNodeProvider);
    final locationFocusNode = ref.watch(locationFocusNodeProvider);
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16.h,
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
          JobStatusDropdownConsumer(statusProvider: statusProvider),
          JobModeDropdownConsumer(modeProvider: modeProvider),
        ],
      ),
    );
  }
}
