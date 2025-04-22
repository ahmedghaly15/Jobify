import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/router/app_router.dart';
import '../../../../core/utils/app_strings.dart';
import 'widgets/auth_sub_title.dart';
import 'widgets/auth_title.dart';
import 'widgets/have_acc_questions.dart';
import 'widgets/login_consumer_button.dart';
import 'widgets/login_form.dart';
import 'widgets/or_continue_with.dart';
import 'widgets/remember_me_and_forgot_pass.dart';
import 'widgets/social_icons.dart';

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
            const SliverToBoxAdapter(child: LoginConsumerButton()),
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.only(top: 46.h, bottom: 32.h),
                child: const OrContinueWith(),
              ),
            ),
            const SliverToBoxAdapter(child: SocialIcons()),
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
                      onPressed: () => context.pushRoute(const RegisterRoute()),
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
