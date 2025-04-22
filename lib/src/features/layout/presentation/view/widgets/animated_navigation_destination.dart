import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../../core/theming/app_colors.dart';

class AnimatedNavigationDestination extends StatelessWidget {
  final IconData? icon;
  final String label;
  final Widget? iconWidget;

  const AnimatedNavigationDestination({
    super.key,
    this.icon,
    required this.label,
    this.iconWidget,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationDestination(
      icon: iconWidget ?? LucideIconWidget(icon!),
      selectedIcon:
          icon == null
              ? null
              : Container(
                padding: EdgeInsets.all(12.h),
                decoration: const BoxDecoration(
                  color: AppColors.primaryColor,
                  shape: BoxShape.circle,
                ),
                child: LucideIconWidget(icon!, weight: LucideIconsWeight.w500),
              ).animate().fadeIn().scale(duration: 200.milliseconds),

      label: label,
    );
  }
}
