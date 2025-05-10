import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widgets/email_text_form_field.dart';
import '../../../../../core/widgets/name_text_form_field.dart';
import '../../../../../core/widgets/password_text_form_field.dart';
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
          NameTextFormField(controller: nameController),
          EmailTextFormField(controller: emailController),
          const _ProfilePassFieldConsumer(),
        ],
      ),
    );
  }
}

class _ProfilePassFieldConsumer extends ConsumerWidget {
  const _ProfilePassFieldConsumer();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(profilePassControllerProvider);
    final obscureText = ref.watch(profilePassObscureTextProvider);
    return PasswordTextFormField(
      passController: controller,
      obscureText: obscureText,
      suffixOnPressed: () {
        ref.read(profilePassObscureTextProvider.notifier).toggle();
      },
    );
  }
}
