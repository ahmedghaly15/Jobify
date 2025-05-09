import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_router_observer.dart';
import 'core/router/app_router.dart';
import 'core/theming/theming_provider.dart';
import 'core/utils/const_strings.dart';

class JobifyApp extends StatelessWidget {
  const JobifyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, __) => const JobifyMaterialAppConsumer(),
    );
  }
}

class JobifyMaterialAppConsumer extends ConsumerWidget {
  const JobifyMaterialAppConsumer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: ConstStrings.appTitle,
      theme: theme,
      themeMode:
          theme.brightness == Brightness.dark
              ? ThemeMode.dark
              : ThemeMode.light,
      routerConfig: ref
          .read(appRouterProvider)
          .config(
            navigatorObservers:
                () => [AppRouterObserver(), AutoRouteObserver()],
          ),
    );
  }
}
