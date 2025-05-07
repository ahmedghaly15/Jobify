import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_skeletonizer.dart';
import 'job_item.dart';

class JobsLoadingSliver extends StatelessWidget {
  const JobsLoadingSliver({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSkeletonizer(
      type: CustomSkeletonizerType.sliver,
      child: SliverGrid.count(
        crossAxisCount: 1,
        children: List.generate(
          10,
          (index) => const JobItem(isLoading: true),
          growable: false,
        ),
      ),
    );
  }
}
