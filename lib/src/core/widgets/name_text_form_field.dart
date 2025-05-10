import 'package:flutter/material.dart';
import 'package:jobify/src/core/helpers/extensions.dart';

import '../helpers/field_validator.dart';
import '../utils/app_strings.dart';
import 'custom_text_form_field.dart';

class NameTextFormField extends StatelessWidget {
  const NameTextFormField({
    super.key,
    required this.controller,
    this.nextFocusNode,
  });

  final TextEditingController controller;
  final FocusNode? nextFocusNode;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: controller,
      hintText: AppStrings.name,
      textCapitalization: TextCapitalization.words,
      keyboardType: TextInputType.name,
      validating: (val) => FieldValidator.validatingNameField(val),
      onEditingComplete:
          nextFocusNode != null
              ? () => context.requestFocus(nextFocusNode!)
              : null,
    );
  }
}
