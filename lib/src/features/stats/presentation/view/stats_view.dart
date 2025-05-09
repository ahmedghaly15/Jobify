import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/adaptive_refresh_indicator.dart';
import '../../../../core/widgets/custom_sliver_app_bar.dart';
import '../../../add_job/presentation/providers/add_job_provider.dart';
import '../providers/stats_providers.dart';
import 'widgets/stats_sliver_list_consumer.dart';

@RoutePage()
class StatsView extends ConsumerWidget {
  const StatsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AdaptiveRefreshIndicator(
      onRefresh:
          () => ref.refresh(statsProvider(ref.watch(statusProvider)).future),
      child: CustomScrollView(
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
      ),
    );
  }
}
