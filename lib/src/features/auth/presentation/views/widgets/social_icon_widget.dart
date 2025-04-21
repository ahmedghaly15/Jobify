import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/theming/app_colors.dart';

class SocialIconWidget extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: icon ?? SvgPicture.asset(assetPath, fit: BoxFit.cover),
      style: IconButton.styleFrom(
        backgroundColor: AppColors.colorF5F5F5,
        shape: const CircleBorder(),
      ),
    );
  }
}
