import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_text_styles.dart';

class JobDetail extends StatelessWidget {
  const JobDetail({super.key, required this.icon, required this.title});

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8.w,
      children: [
        LucideIconWidget(icon, color: AppColors.primaryColor),
        Text(title, style: AppTextStyles.font14Medium),
      ],
    );
  }
}
