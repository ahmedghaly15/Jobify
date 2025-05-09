import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/theming_provider.dart';

class SocialIconWidget extends ConsumerWidget {
  const SocialIconWidget({
    super.key,
    required this.assetPath,
    required this.onPressed,
    this.icon,
  });

  final String assetPath;
  final VoidCallback onPressed;
  final Widget? icon;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(isDarkModeProvider);
    return IconButton(
      onPressed: onPressed,
      icon: icon ?? SvgPicture.asset(assetPath, fit: BoxFit.cover),
      style: IconButton.styleFrom(
        backgroundColor:
            isDarkMode ? AppColors.color1f283b : AppColors.colorF5F5F5,
        shape: const CircleBorder(),
      ),
    );
  }
}
