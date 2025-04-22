import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class CustomNavigationDestination extends StatelessWidget {
  final IconData icon;
  final String label;

  const CustomNavigationDestination({
    super.key,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationDestination(
      icon: LucideIconWidget(icon),
      selectedIcon: LucideIconWidget(icon, weight: LucideIconsWeight.w500),

      label: label,
    );
  }
}
