import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/utils/app_assets.dart';

class SocialIcons extends StatelessWidget {
  const SocialIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        _socialIcons.length,
        (index) => Container(
          margin: EdgeInsetsDirectional.only(start: index == 0 ? 0 : 32.w),
          child: CircleAvatar(
            radius: 25.r,
            backgroundColor: AppColors.colorF5F5F5,
            child: SvgPicture.asset(_socialIcons[index], fit: BoxFit.cover),
          ),
        ),
        growable: false,
      ),
    );
  }
}

const List<String> _socialIcons = [
  Assets.svgsGoogle,
  Assets.svgsFacebook,
  Assets.svgsLinkedin,
];
