import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobify/src/core/helpers/extensions.dart';

import '../../../../../core/helpers/field_validator.dart';
import '../../../../../core/theming/app_text_styles.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../providers/add_job_provider.dart';
import 'job_mode_dropdown_consumer.dart';
import 'job_status_dropdown_consumer.dart';

const _moveBegin = -50.0;
const _moveEnd = 0.0;

class AnimatedAddJobForm extends ConsumerWidget {
  const AnimatedAddJobForm({super.key});

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
          Text(
            AppStrings.addJob,
            style: AppTextStyles.font36SemiBold,
          ).animate().fadeIn().moveY(
            begin: _moveBegin.h,
            end: _moveEnd,
            duration: 400.milliseconds,
          ),
          CustomTextFormField(
            controller: positionController,
            hintText: AppStrings.position,
            validating: (value) => FieldValidator.validatingEmptyField(value),
          ).animate().fadeIn().moveY(
            begin: _moveBegin.h,
            end: _moveEnd,
            duration: 400.milliseconds,
            delay: 200.milliseconds,
          ),
          CustomTextFormField(
            controller: companyController,
            hintText: AppStrings.company,
            focusNode: companyFocusNode,
            validating: (value) => FieldValidator.validatingEmptyField(value),
            onEditingComplete: () => context.requestFocus(locationFocusNode),
          ).animate().fadeIn().moveY(
            begin: _moveBegin.h,
            end: _moveEnd,
            duration: 400.milliseconds,
            delay: 400.milliseconds,
          ),
          CustomTextFormField(
            controller: locationController,
            focusNode: locationFocusNode,
            hintText: AppStrings.location,
            validating: (value) => FieldValidator.validatingEmptyField(value),
          ).animate().fadeIn().moveY(
            begin: _moveBegin.h,
            end: _moveEnd,
            duration: 400.milliseconds,
            delay: 600.milliseconds,
          ),
          const JobStatusDropdownConsumer().animate().fadeIn().moveY(
            begin: _moveBegin.h,
            end: _moveEnd,
            duration: 400.milliseconds,
            delay: 800.milliseconds,
          ),
          const JobModeDropdownConsumer().animate().fadeIn().moveY(
            begin: _moveBegin.h,
            end: _moveEnd,
            duration: 400.milliseconds,
            delay: 1000.milliseconds,
          ),
        ],
      ),
    );
  }
}
