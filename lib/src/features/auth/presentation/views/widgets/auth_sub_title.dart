import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_text_styles.dart';
import '../../../../../core/theming/theming_provider.dart';

class AuthSubTitle extends ConsumerWidget {
  const AuthSubTitle({super.key, required this.subTitle});

  final String subTitle;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(isDarkModeProvider);
    return Text(
      subTitle,
      style: AppTextStyles.font14Regular.copyWith(
        color: isDarkMode ? Colors.white60 : AppColors.color757575,
      ),
    );
  }
}
