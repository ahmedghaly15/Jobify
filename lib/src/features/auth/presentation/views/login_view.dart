import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_text_styles.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/widgets/primary_button.dart';
import 'widgets/auth_sub_title.dart';
import 'widgets/auth_title.dart';
import 'widgets/have_acc_questions.dart';
import 'widgets/login_form.dart';
import 'widgets/remember_me_and_forgot_pass.dart';

@RoutePage()
class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 24.h),
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: AuthTitle(title: AppStrings.welcomeBack),
            ),
            const SliverToBoxAdapter(
              child: AuthSubTitle(subTitle: AppStrings.loginViewSubTitle),
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.only(top: 36.h),
                child: const LoginForm(),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.only(top: 16.h, bottom: 32.h),
                child: const RememberMeAndForgotPass(),
              ),
            ),
            SliverToBoxAdapter(
              child: PrimaryButton(onPressed: () {}, text: AppStrings.signIn),
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.only(top: 46.h, bottom: 32.h),
                child: Row(
                  spacing: 8.w,
                  children: [
                    Expanded(
                      child: Divider(
                        color: AppColors.colorE0E0E0,
                        thickness: 1.5.h,
                      ),
                    ),
                    Text(
                      AppStrings.orContinueWith,
                      style: AppTextStyles.font12Regular.copyWith(
                        color: AppColors.color9E9E9E,
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: AppColors.colorE0E0E0,
                        thickness: 1.5.h,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  Constants.socialIcons.length,
                  (index) => Container(
                    margin: EdgeInsetsDirectional.only(
                      start: index == 0 ? 0 : 32.w,
                    ),
                    child: CircleAvatar(
                      radius: 25.r,
                      backgroundColor: AppColors.colorF5F5F5,
                      child: SvgPicture.asset(
                        Constants.socialIcons[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  growable: false,
                ),
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 24.h),
                child: Column(
                  spacing: 24.h,
                  children: <Widget>[
                    const Spacer(),
                    HaveAccQuestion(
                      buttonText: AppStrings.signUp,
                      question: AppStrings.dontHaveAnAccount,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
