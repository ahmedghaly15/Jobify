import 'package:flutter/material.dart';
import 'package:jobify/src/core/helpers/extensions.dart';

import '../../../../../core/helpers/field_validator.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';

class EmailTextFormField extends StatelessWidget {
  const EmailTextFormField({
    super.key,
    required this.emailController,
    this.emailFocusNode,
    required this.nextFocusNode,
  });

  final TextEditingController emailController;
  final FocusNode? emailFocusNode;
  final FocusNode nextFocusNode;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: emailController,
      focusNode: emailFocusNode,
      hintText: AppStrings.email,
      autofillHints: const <String>[AutofillHints.email],
      keyboardType: TextInputType.emailAddress,
      validating:
          (String? val) => FieldValidator.validatingEmailField(value: val),
      onEditingComplete: () => context.requestFocus(nextFocusNode),
    );
  }
}
