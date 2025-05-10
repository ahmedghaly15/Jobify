import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobify/src/core/helpers/extensions.dart';

import '../theming/app_colors.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({
    super.key,
    this.titleText,
    this.actions,
    this.titleWidget,
    this.leading,
    this.hasLeading = true,
    this.backgroundColor,
  });

  final String? titleText;
  final List<Widget>? actions;
  final Widget? titleWidget;
  final Widget? leading;
  final bool hasLeading;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: backgroundColor,
      title: titleWidget ?? (titleText.isNullOrEmpty ? null : Text(titleText!)),
      leading: hasLeading ? leading ?? const ArrowBackIconButton() : null,
      actions: actions,
    );
  }
}

class ArrowBackIconButton extends StatelessWidget {
  const ArrowBackIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => context.pop(),
      style: IconButton.styleFrom(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: AppColors.colorEDEDED, width: 1.w),
          borderRadius: BorderRadius.circular(10.r),
        ),
        foregroundColor: context.isDarkModeActive ? Colors.white : Colors.black,
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
        iconSize: 16.h,
      ),
      icon: const Icon(Icons.arrow_back_ios_new),
    );
  }
}
