import 'package:flutter/material.dart';
import 'package:jobify/src/core/helpers/extensions.dart';

import '../helpers/field_validator.dart';
import '../utils/app_strings.dart';
import 'custom_text_form_field.dart';

class EmailTextFormField extends StatelessWidget {
  const EmailTextFormField({
    super.key,
    this.controller,
    this.emailFocusNode,
    this.nextFocusNode,
    this.initialValue,
    this.onChanged,
  });

  final TextEditingController? controller;
  final FocusNode? emailFocusNode, nextFocusNode;
  final String? initialValue;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      initialValue: initialValue,
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
      onChanged: onChanged,
    );
  }
}
