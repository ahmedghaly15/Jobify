import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobify/src/core/helpers/extensions.dart';

import '../../../../../core/helpers/field_validator.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../providers/form_notifier_providers.dart';
import '../../providers/register_providers.dart';
import 'email_text_form_field.dart';
import 'password_text_form_field.dart';

class RegisterForm extends ConsumerWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final autovalidateMode = ref.watch(registerAutovalidateModeProvider);
    final formKey = ref.watch(registerFormKeyProvider);
    final nameController = ref.watch(registerNameControllerProvider);
    final emailController = ref.watch(registerEmailControllerProvider);
    final emailFocusNode = ref.read(registerEmailFocusNodeProvider);
    final passwordFocusNode = ref.read(registerPassFocusNodeProvider);
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        spacing: 16.h,
        children: <Widget>[
          CustomTextFormField(
            controller: nameController,
            hintText: AppStrings.name,
            textCapitalization: TextCapitalization.words,
            keyboardType: TextInputType.name,
            validating: (val) => FieldValidator.validatingNameField(val),
            onEditingComplete: () => context.requestFocus(emailFocusNode),
          ),
          EmailTextFormField(
            emailController: emailController,
            emailFocusNode: emailFocusNode,
            nextFocusNode: passwordFocusNode,
          ),
          const _PasswordTextFieldConsumer(),
          const _ConfirmPassFieldConsumer(),
        ],
      ),
    );
  }
}

class _ConfirmPassFieldConsumer extends ConsumerWidget {
  const _ConfirmPassFieldConsumer({
    // ignore: unused_element_parameter
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final confirmPassController = ref.watch(
      registerConfirmPassControllerProvider,
    );
    final confirmPassFocusNode = ref.read(registerConfirmPassFocusNodeProvider);
    final passwordController = ref.watch(registerPassControllerProvider);
    final confirmPassObscureText = ref.watch(confirmPassObscureTextProvider);
    return PasswordTextFormField(
      hintText: AppStrings.confirmPass,
      passController: confirmPassController,
      passFocusNode: confirmPassFocusNode,
      obscureText: confirmPassObscureText,
      suffixOnPressed:
          () => ref.read(confirmPassObscureTextProvider.notifier).toggle(),
      validating:
          (val) => FieldValidator.validatingConfirmPasswordField(
            password: passwordController.text,
            confirmPassword: val,
          ),
    );
  }
}

class _PasswordTextFieldConsumer extends ConsumerWidget {
  const _PasswordTextFieldConsumer({
    // ignore: unused_element_parameter
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final passwordController = ref.watch(registerPassControllerProvider);
    final passwordFocusNode = ref.read(registerPassFocusNodeProvider);
    final confirmPassFocusNode = ref.read(registerConfirmPassFocusNodeProvider);
    final passObscureText = ref.watch(registerPassObscureTextProvider);
    return PasswordTextFormField(
      passController: passwordController,
      passFocusNode: passwordFocusNode,
      nextFocusNode: confirmPassFocusNode,
      obscureText: passObscureText,
      suffixOnPressed:
          () => ref.read(registerPassObscureTextProvider.notifier).toggle(),
    );
  }
}
