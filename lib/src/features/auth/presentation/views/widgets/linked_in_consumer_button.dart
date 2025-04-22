import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/functions/listen_to_social_auth_provider.dart';
import '../../../data/repos/social_auth_repo.dart';
import '../../providers/social_auth_providers.dart';
import 'social_icon_widget.dart';

class LinkedInConsumerButton extends ConsumerWidget {
  const LinkedInConsumerButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    listenToSocialAuthProvider(
      ref,
      context,
      socialOAuthProvider(linkedinAuthRepoProvider),
    );
    return SocialIconWidget(
      assetPath: Assets.svgsLinkedin,
      onPressed:
          () =>
              ref
                  .read(socialOAuthProvider(linkedinAuthRepoProvider).notifier)
                  .signIn(),
    );
  }
}
