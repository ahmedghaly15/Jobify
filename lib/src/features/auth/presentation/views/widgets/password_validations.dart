import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobify/src/core/helpers/extensions.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_text_styles.dart';
import '../../providers/form_notifier_providers.dart';
import '../../providers/register_providers.dart';

class PasswordValidations extends ConsumerStatefulWidget {
  const PasswordValidations({super.key});

  @override
  ConsumerState<PasswordValidations> createState() =>
      _PasswordValidationsState();
}

class _PasswordValidationsState extends ConsumerState<PasswordValidations> {
  void _listener() {
    final passController = ref.watch(registerPassControllerProvider);
    ref
        .read(passValidationsProvider.notifier)
        .validatePassword(passController.text);
  }

  @override
  void didChangeDependencies() {
    final passController = ref.watch(registerPassControllerProvider);
    passController.addListener(_listener);
    super.didChangeDependencies();
  }

  @override
  void deactivate() {
    final passController = ref.watch(registerPassControllerProvider);
    passController.removeListener(_listener);
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    final passValidations = ref.watch(passValidationsProvider);
    return Column(
      spacing: 2.h,
      children: [
        _buildValidationRow(
          'At least 1 lowercase letter',
          passValidations.hasLowercase,
        ),
        _buildValidationRow(
          'At least 1 uppercase letter',
          passValidations.hasUppercase,
        ),
        _buildValidationRow(
          'At least 1 special character',
          passValidations.hasSpecialCharacters,
        ),
        _buildValidationRow('At least 1 number', passValidations.hasNumber),
        _buildValidationRow(
          'At least 8 characters long',
          passValidations.hasMinLength,
        ),
      ],
    );
  }

  Widget _buildValidationRow(String text, bool hasValidated) {
    return Row(
      spacing: 6.w,
      children: [
        CircleAvatar(radius: 2.5.r, backgroundColor: AppColors.color757575),
        Text(
          //'At least 1 lowercase letter',
          text,
          style: AppTextStyles.font13Regular.copyWith(
            decoration: hasValidated ? TextDecoration.lineThrough : null,
            decorationColor: Colors.green,
            decorationThickness: 2.w,
            color:
                hasValidated
                    ? AppColors.color757575
                    : (context.isDarkModeActive
                        ? Colors.white60
                        : AppColors.color242424),
          ),
        ),
      ],
    );
  }
}
