import 'package:flutter/material.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_text_styles.dart';
import '../../../../../core/utils/app_strings.dart';

class RememberMeAndForgotPass extends StatelessWidget {
  const RememberMeAndForgotPass({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Transform.scale(
          scale: 1.2,
          child: Checkbox.adaptive(value: true, onChanged: (val) {}),
        ),
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
