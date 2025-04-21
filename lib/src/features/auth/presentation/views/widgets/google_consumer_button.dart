import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/functions/listen_to_social_auth_provider.dart';
import '../../../../../core/widgets/adaptive_circular_progress_indicator.dart';
import '../../providers/social_auth_providers.dart';
import 'social_icon_widget.dart';

class GoogleConsumerButton extends ConsumerWidget {
  const GoogleConsumerButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    listenToSocialAuthProvider(
      ref,
      context,
      googleAuthProvider,
      shouldAwaitBeforeNavigation: false,
    );
    final googleAuth = ref.watch(googleAuthProvider);
    return SocialIconWidget(
      assetPath: Assets.svgsGoogle,
      icon: googleAuth?.whenOrNull(
        loading:
            () => SizedBox.square(
              dimension: 24.h,
              child: const AdaptiveCircularProgressIndicator(
                color: AppColors.primaryColor,
                strokeWidth: 3,
              ),
            ),
      ),
      onPressed: () => ref.read(googleAuthProvider.notifier).signIn(),
    );
  }
}
