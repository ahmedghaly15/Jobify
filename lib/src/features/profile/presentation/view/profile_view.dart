import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobify/src/core/helpers/extensions.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_text_styles.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/widgets/custom_sliver_app_bar.dart';
import 'widgets/logout_consumer_button.dart';
import 'widgets/profile_form_consumer.dart';
import 'widgets/update_profile_consumer_button.dart';

@RoutePage()
class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: CustomScrollView(
          slivers: [
            const CustomSliverAppBar(
              titleText: AppStrings.profile,
              actions: [LogOutConsumerButton()],
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 24.h,
                children: [
                  CircleAvatar(
                    radius: 50.r,
                    backgroundColor: AppColors.primaryColor,
                    child: Text(
                      currentUser?.user?.email?.capitalizeFirst() ?? 'A',
                      style: AppTextStyles.font24SemiBold.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 24.h, bottom: 16.h),
                    child: const ProfileFormConsumer(),
                  ),
                  const UpdateProfileConsumerButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
