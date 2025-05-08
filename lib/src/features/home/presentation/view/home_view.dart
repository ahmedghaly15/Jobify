import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/adaptive_refresh_indicator.dart';
import '../../../../core/widgets/custom_sliver_app_bar.dart';
import '../providers/home_providers.dart';
import 'widgets/jobs_sliver_grid_consumer.dart';

@RoutePage()
class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AdaptiveRefreshIndicator(
      onRefresh: () => ref.refresh(fetchJobsProvider.future),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const CustomSliverAppBar(
            titleText: AppStrings.allJobs,
            hasLeading: false,
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            sliver: const JobsSliverGridConsumer(),
          ),
        ],
      ),
    );
  }
}
