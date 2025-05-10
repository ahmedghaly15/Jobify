import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/field_validator.dart';
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
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        spacing: 16.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NameTextFormField(
            initialValue: ref.read(profileNameTextProvider),
            onChanged: (value) {
              ref
                  .read(profileNameTextProvider.notifier)
                  .update((state) => value);
            },
          ),
          EmailTextFormField(
            initialValue: ref.read(profileEmailTextProvider),
            onChanged:
                (value) => ref
                    .read(profileEmailTextProvider.notifier)
                    .update((state) => value),
          ),
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
    final obscureText = ref.watch(profilePassObscureTextProvider);
    return PasswordTextFormField(
      initialValue: ref.read(profilePassTextProvider),
      obscureText: obscureText,
      suffixOnPressed: () {
        ref.read(profilePassObscureTextProvider.notifier).toggle();
      },
      onChanged:
          (value) => ref
              .read(profilePassTextProvider.notifier)
              .update((state) => value),
      validating:
          (value) => FieldValidator.validateOptionalPassword(value: value),
    );
  }
}
