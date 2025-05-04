import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../core/router/app_router.dart';
import '../../../../core/utils/app_strings.dart';
import 'widgets/animated_navigation_destination.dart';

@RoutePage()
class LayoutView extends StatelessWidget {
  const LayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        HomeRoute(),
        AddJobRoute(),
        SearchRoute(),
        StatsRoute(),
      ],
      bottomNavigationBuilder:
          (_, tabsRouter) => DecoratedBox(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, -2),
                  blurRadius: 30,
                  spreadRadius: 0,
                  color: Colors.black.withAlpha(13),
                ),
              ],
            ),
            child: NavigationBar(
              animationDuration: const Duration(milliseconds: 300),
              selectedIndex: tabsRouter.activeIndex,
              onDestinationSelected: tabsRouter.setActiveIndex,
              destinations: const [
                AnimatedNavigationDestination(
                  icon: LucideIcons.user,
                  label: AppStrings.home,
                ),
                AnimatedNavigationDestination(
                  icon: LucideIcons.layers,
                  label: AppStrings.addJob,
                ),
                AnimatedNavigationDestination(
                  icon: LucideIcons.search,
                  label: AppStrings.search,
                ),
                AnimatedNavigationDestination(
                  icon: LucideIcons.chartArea,
                  label: AppStrings.stats,
                ),

              ],
            ),
          ),
    );
  }
}
