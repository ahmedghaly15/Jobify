import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_assets.dart';
import 'facebook_consumer_button.dart';
import 'social_icon_widget.dart';

class SocialIcons extends StatelessWidget {
  const SocialIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 32.w,
      children: [
        SocialIconWidget(
          assetPath: Assets.svgsGoogle,
          onPressed: () {
            // Handle Google sign-in
          },
        ),
        const FacebookConsumerButton(),
        SocialIconWidget(
          assetPath: Assets.svgsLinkedin,
          onPressed: () {
            // Handle LinkedIn sign-in
          },
        ),
      ],
    );
  }
}
