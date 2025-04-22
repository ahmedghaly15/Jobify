import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        AddJobRoute(),
        SearchRoute(),
        StatsRoute(),
        ProfileRoute(),
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
              destinations: [
                const AnimatedNavigationDestination(
                  icon: LucideIcons.layers,
                  label: AppStrings.addJob,
                ),
                const AnimatedNavigationDestination(
                  icon: LucideIcons.search,
                  label: AppStrings.search,
                ),
                const AnimatedNavigationDestination(
                  icon: LucideIcons.chartArea,
                  label: AppStrings.stats,
                ),
                AnimatedNavigationDestination(
                  iconWidget: CachedNetworkImage(
                    imageUrl:
                        'https://img.freepik.com/free-vector/mysterious-mafia-man-smoking-cigarette_52683-34828.jpg?t=st=1745322925~exp=1745326525~hmac=ce906da52ec12b5bc32bd7186f68c25538793806b962cb864f203397c0879e81&w=826',
                    imageBuilder:
                        (_, image) =>
                            CircleAvatar(radius: 24.r, backgroundImage: image),
                  ),
                  label: AppStrings.profile,
                ),
              ],
            ),
          ),
    );
  }
}
