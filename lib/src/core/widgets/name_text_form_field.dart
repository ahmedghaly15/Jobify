import 'package:flutter/material.dart';
import 'package:jobify/src/core/helpers/extensions.dart';

import '../helpers/field_validator.dart';
import '../utils/app_strings.dart';
import 'custom_text_form_field.dart';

class NameTextFormField extends StatelessWidget {
  const NameTextFormField({
    super.key,
    this.controller,
    this.nextFocusNode,
    this.initialValue,
    this.onChanged,
  });

  final TextEditingController? controller;
  final FocusNode? nextFocusNode;
  final String? initialValue;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      initialValue: initialValue,
      controller: controller,
      hintText: AppStrings.name,
      textCapitalization: TextCapitalization.words,
      keyboardType: TextInputType.name,
      validating: (val) => FieldValidator.validatingNameField(val),
      onEditingComplete:
          nextFocusNode != null
              ? () => context.requestFocus(nextFocusNode!)
              : null,
      onChanged: onChanged,
    );
  }
}
