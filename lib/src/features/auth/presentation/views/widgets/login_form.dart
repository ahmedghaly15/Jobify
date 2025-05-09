import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../providers/form_notifier_providers.dart';
import '../../providers/login_providers.dart';
import 'email_text_form_field.dart';
import 'password_text_form_field.dart';

class LoginForm extends ConsumerWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final autovalidateMode = ref.watch(loginAutovalidateModeProvider);
    final formKey = ref.watch(loginFormKeyProvider);
    final emailController = ref.watch(loginEmailControllerProvider);
    final passFocusNode = ref.read(loginPassFocusNodeProvider);
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        spacing: 16.h,
        children: <Widget>[
          EmailTextFormField(
            emailController: emailController,
            nextFocusNode: passFocusNode,
          ),
          const _PassFieldConsumer(),
        ],
      ),
    );
  }
}

class _PassFieldConsumer extends ConsumerWidget {
  const _PassFieldConsumer();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final obscureText = ref.watch(loginPassObscureTextProvider);
    final passController = ref.watch(loginPassControllerProvider);
    final passFocusNode = ref.read(loginPassFocusNodeProvider);
    return PasswordTextFormField(
      passController: passController,
      passFocusNode: passFocusNode,
      obscureText: obscureText,
      suffixOnPressed:
          () => ref.read(loginPassObscureTextProvider.notifier).toggle(),
    );
  }
}
