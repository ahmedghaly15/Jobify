import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/theme_icon_button_consumer.dart';
import 'widgets/custom_search_sliver_app_bar.dart';
import 'widgets/search_jobs_sliver_grid_consumer.dart';

@RoutePage()
class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 32.h, horizontal: 16.w),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const CustomSearchSliverAppBar(actions: [ThemeIconButtonConsumer()]),
          SliverPadding(
            padding: EdgeInsets.symmetric(vertical: 16.h),
            sliver: const SearchJobsSliverGridConsumer(),
          ),
        ],
      ),
    );
  }
}
