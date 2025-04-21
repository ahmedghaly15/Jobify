import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'facebook_consumer_button.dart';
import 'google_consumer_button.dart';
import 'linked_in_consumer_button.dart';

class SocialIcons extends StatelessWidget {
  const SocialIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 32.w,
      children: const [
        GoogleConsumerButton(),
        FacebookConsumerButton(),
        LinkedInConsumerButton(),
      ],
    );
  }
}
