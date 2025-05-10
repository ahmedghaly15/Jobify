import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/field_validator.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../providers/profile_providers.dart';

class ProfileFormConsumer extends ConsumerWidget {
  const ProfileFormConsumer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = ref.watch(profileFormKeyProvider);
    final autovalidateMode = ref.watch(profileAutovalidateModeProvider);
    final emailController = ref.watch(profileEmailControllerProvider);
    final nameController = ref.watch(profileNameControllerProvider);
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        spacing: 16.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextFormField(
            controller: nameController,
            hintText: AppStrings.name,
            validating: (value) => FieldValidator.validatingNameField(value),
          ),
          CustomTextFormField(
            controller: emailController,
            hintText: AppStrings.email,
            validating:
                (value) => FieldValidator.validatingEmailField(value: value),
          ),
        ],
      ),
    );
  }
}
