import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/primary_button.dart';
import '../../providers/profile_providers.dart';

class UpdateProfileConsumerButton extends ConsumerWidget {
  const UpdateProfileConsumerButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEnabled = ref.watch(isUpdateProfileButtonEnabledProvider);
    return PrimaryButton(
      onPressed: isEnabled ? () {} : null,
      text: AppStrings.update,
    );
  }
}
