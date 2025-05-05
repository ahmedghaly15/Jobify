import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';

class CustomSearchSliverAppBar extends StatelessWidget {
  const CustomSearchSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Row(
        spacing: 16.w,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Expanded(
            child: CustomTextFormField(hintText: AppStrings.search),
          ),
          IconButton.outlined(
            style: IconButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
              side: BorderSide(color: AppColors.colorEDEDED, width: 1.w),
            ),
            onPressed: () {},
            icon: const LucideIconWidget(LucideIcons.listFilter),
          ),
        ],
      ),
    );
  }
}
