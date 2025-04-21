import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/functions/listen_to_social_auth_provider.dart';
import '../../providers/social_auth_providers.dart';
import 'social_icon_widget.dart';

class FacebookConsumerButton extends ConsumerWidget {
  const FacebookConsumerButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    listenToSocialAuthProvider(ref, context, facebookAuthProvider);
    return SocialIconWidget(
      assetPath: Assets.svgsFacebook,
      onPressed: () => ref.read(facebookAuthProvider.notifier).signIn(),
    );
  }
}
