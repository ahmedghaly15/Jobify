import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/custom_sliver_app_bar.dart';
import 'widgets/stats_sliver_list_consumer.dart';

@RoutePage()
class StatsView extends StatelessWidget {
  const StatsView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        const CustomSliverAppBar(
          hasLeading: false,
          titleText: AppStrings.stats,
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          sliver: const StatsSliverListConsumer(),
        ),
      ],
    );
  }
}
