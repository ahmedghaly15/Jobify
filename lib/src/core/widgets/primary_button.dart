import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/app_colors.dart';
import '../theming/app_text_styles.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.onPressed,
    this.text,
    this.borderRadius,
    this.textStyle,
    this.backgroundColor,
    this.textColor,
    this.boxShadow,
    this.child,
    this.width,
    this.height,
    this.isExpanded = true,
    this.padding,
  });

  final String? text;
  final double? borderRadius;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final Color? textColor;
  final VoidCallback? onPressed;
  final List<BoxShadow>? boxShadow;
  final Widget? child;
  final double? width;
  final double? height;
  final bool isExpanded;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isExpanded ? double.infinity : width?.w,
      height: height?.h,
      decoration: BoxDecoration(
        color:
            backgroundColor ??
            (onPressed == null ? Colors.grey.shade400 : AppColors.primaryColor),
        borderRadius: BorderRadiusDirectional.circular(
          (borderRadius?.r) ?? 16.0.r,
        ),
        boxShadow: boxShadow,
        border:
            onPressed == null
                ? null
                : Border.all(color: AppColors.primaryColor, width: 1.w),
      ),
      child: MaterialButton(
        onPressed: onPressed,
        padding:
            height == null
                ? (padding ?? EdgeInsets.symmetric(vertical: 14.h))
                : null,
        materialTapTargetSize: MaterialTapTargetSize.padded,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(
            (borderRadius?.r) ?? 16.0.r,
          ),
        ),
        child:
            child ??
            Text(
              text!,
              style:
                  textStyle ??
                  AppTextStyles.font14Medium.copyWith(
                    color: textColor ?? Colors.white,
                  ),
            ),
      ),
    );
  }
}
