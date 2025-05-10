import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobify/src/core/helpers/extensions.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_text_styles.dart';
import '../../../../core/utils/constants.dart';
import 'widgets/update_profile_consumer_button.dart';

@RoutePage()
class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 32.h, horizontal: 16.w),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: CircleAvatar(
                radius: 50.r,
                backgroundColor: AppColors.primaryColor,
                child: Text(
                  currentUser?.user?.email?.capitalizeFirst() ?? 'A',
                  style: AppTextStyles.font24SemiBold,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.only(top: 24.h, bottom: 16.h),
                child: const UpdateProfileConsumerButton(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
