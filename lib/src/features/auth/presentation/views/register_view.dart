import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/primary_button.dart';
import 'widgets/auth_sub_title.dart';
import 'widgets/auth_title.dart';
import 'widgets/have_acc_questions.dart';
import 'widgets/or_continue_with.dart';
import 'widgets/password_validations.dart';
import 'widgets/register_form.dart';
import 'widgets/social_icons.dart';

@RoutePage()
class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: AuthTitle(title: AppStrings.createAccount),
            ),
            const SliverToBoxAdapter(
              child: AuthSubTitle(subTitle: AppStrings.registerViewDescription),
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.only(top: 16.h, bottom: 12.h),
                child: const RegisterForm(),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.only(bottom: 24.h),
                child: const PasswordValidations(),
              ),
            ),
            SliverToBoxAdapter(
              child: PrimaryButton(onPressed: () {}, text: AppStrings.signUp),
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.only(top: 46.h, bottom: 32.h),
                child: const OrContinueWith(),
              ),
            ),
            const SliverToBoxAdapter(child: SocialIcons()),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                spacing: 24.h,
                children: <Widget>[
                  const Spacer(),
                  HaveAccQuestion(
                    question: AppStrings.alreadyHaveAnAccount,
                    buttonText: AppStrings.signIn,
                    onPressed: () => context.maybePop(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
