import 'package:jobify/src/core/helpers/extensions.dart';
import 'package:flutter/material.dart';

import '../helpers/field_validator.dart';
import '../theming/app_colors.dart';
import '../utils/app_strings.dart';
import 'custom_text_form_field.dart';

class PasswordTextFormField extends StatelessWidget {
  const PasswordTextFormField({
    super.key,
    this.passController,
    required this.obscureText,
    required this.suffixOnPressed,
    this.passFocusNode,
    this.nextFocusNode,
    this.validating,
    this.hintText = AppStrings.password,
    this.initialValue,
    this.onChanged,
  });

  final TextEditingController? passController;
  final FocusNode? nextFocusNode, passFocusNode;
  final bool obscureText;
  final VoidCallback suffixOnPressed;
  final String? Function(String?)? validating;
  final String hintText;
  final String? initialValue;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      initialValue: initialValue,
      hintText: hintText,
      controller: passController,
      focusNode: passFocusNode,
      obscureText: obscureText,
      keyboardType: TextInputType.visiblePassword,
      autofillHints: const <String>[AutofillHints.password],
      suffix: IconButton(
        icon: Icon(
          obscureText ? Icons.visibility : Icons.visibility_off,
          color: AppColors.colorC2C2C2,
        ),
        onPressed: suffixOnPressed,
      ),
      validating:
          validating ??
          (val) => FieldValidator.validatingPasswordField(value: val),
      onEditingComplete:
          nextFocusNode != null
              ? () => context.requestFocus(nextFocusNode!)
              : null,
      onChanged: onChanged,
    );
  }
}
