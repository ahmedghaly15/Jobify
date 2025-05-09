import 'package:flutter/material.dart';
import 'package:jobify/src/core/helpers/extensions.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_text_styles.dart';

class AuthSubTitle extends StatelessWidget {
  const AuthSubTitle({super.key, required this.subTitle});

  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Text(
      subTitle,
      style: AppTextStyles.font14Regular.copyWith(
        color:
            context.isDarkModeActive ? Colors.white60 : AppColors.color757575,
      ),
    );
  }
}
