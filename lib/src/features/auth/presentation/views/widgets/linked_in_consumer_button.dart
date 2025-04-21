import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/functions/listen_to_social_auth_provider.dart';
import '../../providers/social_auth_providers.dart';
import 'social_icon_widget.dart';

class LinkedInConsumerButton extends ConsumerWidget {
  const LinkedInConsumerButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    listenToSocialAuthProvider(ref, context, linkedInAuthProvider);

    return SocialIconWidget(
      assetPath: Assets.svgsLinkedin,

      onPressed: () => ref.read(linkedInAuthProvider.notifier).signIn(),
    );
  }
}
