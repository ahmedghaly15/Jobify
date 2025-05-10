import 'package:flutter/material.dart';
import 'package:jobify/src/core/helpers/extensions.dart';

import '../helpers/field_validator.dart';
import '../utils/app_strings.dart';
import 'custom_text_form_field.dart';

class EmailTextFormField extends StatelessWidget {
  const EmailTextFormField({
    super.key,
    required this.controller,
    this.emailFocusNode,
    this.nextFocusNode,
  });

  final TextEditingController controller;
  final FocusNode? emailFocusNode, nextFocusNode;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: controller,
      focusNode: emailFocusNode,
      hintText: AppStrings.email,
      autofillHints: const <String>[AutofillHints.email],
      keyboardType: TextInputType.emailAddress,
      validating:
          (String? val) => FieldValidator.validatingEmailField(value: val),
      onEditingComplete:
          nextFocusNode != null
              ? () => context.requestFocus(nextFocusNode!)
              : null,
    );
  }
}
