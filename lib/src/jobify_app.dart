import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_router_observer.dart';
import 'core/router/app_router.dart';
import 'core/theming/app_themes.dart';
import 'core/utils/app_strings.dart';

class JobifyApp extends ConsumerWidget {
  const JobifyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder:
          (_, __) => MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: AppStrings.appTitle,
            theme: AppThemes.light,
            routerConfig: ref
                .read(appRouterProvider)
                .config(
                  navigatorObservers:
                      () => [AppRouterObserver(), AutoRouteObserver()],
                ),
          ),
    );
  }
}
