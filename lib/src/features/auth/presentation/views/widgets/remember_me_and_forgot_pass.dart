import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_text_styles.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../providers/login_providers.dart';

class RememberMeAndForgotPass extends StatelessWidget {
  const RememberMeAndForgotPass({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Transform.scale(scale: 1.2, child: const RememberMeCheckboxConsumer()),
        Text(
          AppStrings.rememberMe,
          style: AppTextStyles.font12Regular.copyWith(
            color: AppColors.color757575,
          ),
        ),
        const Spacer(),
        TextButton(
          onPressed: () {},
          child: const Text(AppStrings.forgotPassword),
        ),
      ],
    );
  }
}

class RememberMeCheckboxConsumer extends ConsumerWidget {
  const RememberMeCheckboxConsumer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final checkboxValue = ref.watch(checkboxValueProvider);
    return Checkbox.adaptive(
      value: checkboxValue,
      onChanged: (_) => ref.read(checkboxValueProvider.notifier).toggle(),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }
}
