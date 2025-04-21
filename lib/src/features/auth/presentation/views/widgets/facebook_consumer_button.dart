import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobify/src/core/helpers/extensions.dart';

import '../../../../../core/router/app_router.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../providers/social_auth_providers.dart';
import 'social_icon_widget.dart';

class FacebookConsumerButton extends ConsumerWidget {
  const FacebookConsumerButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _listener(ref, context);
    return SocialIconWidget(
      assetPath: Assets.svgsFacebook,
      onPressed: () {
        ref.read(facebookAuthProvider.notifier).signIn();
      },
    );
  }

  void _listener(WidgetRef ref, BuildContext context) {
    ref.listen(facebookAuthProvider, (_, current) {
      current?.whenOrNull(
        data: (_) async {
          await Future.delayed(const Duration(milliseconds: 1500));
          context.router.replaceAll([const HomeRoute()]);
        },
        error:
            (error, _) => context.showAnimatedDialog(
              state: CustomDialogStates.error,
              message: error.toString(),
            ),
      );
    });
  }
}
