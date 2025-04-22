import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/constants.dart';

@RoutePage()
class AddJobView extends StatelessWidget {
  const AddJobView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          sliver: const SliverFillRemaining(
            hasScrollBody: false,
            child: Center(child: Card(child: Column())),
          ),
        ),
      ],
    );
  }
}
