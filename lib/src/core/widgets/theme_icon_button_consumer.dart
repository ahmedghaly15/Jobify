import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../theming/app_colors.dart';
import '../theming/theming_provider.dart';

class ThemeIconButtonConsumer extends ConsumerWidget {
  const ThemeIconButtonConsumer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    return Container(
      margin: EdgeInsetsDirectional.only(end: 16.w),
      child: IconButton.filledTonal(
        style: IconButton.styleFrom(
          backgroundColor: AppColors.primaryColor.withAlpha(127),
        ),
        onPressed: () => ref.read(themeProvider.notifier).toggle(),
        icon: LucideIconWidget(
          theme.brightness == Brightness.light
              ? LucideIcons.moon
              : LucideIcons.sun,
          color:
              theme.brightness == Brightness.light
                  ? Colors.black
                  : Colors.white,
        ),
      ),
    );
  }
}
