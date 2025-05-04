import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart' as skeletonizer;
import 'package:skeletonizer/skeletonizer.dart';

import 'job_item.dart';

class JobsLoadingSliver extends StatelessWidget {
  const JobsLoadingSliver({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer.sliver(
      enabled: true,
      effect: skeletonizer.ShimmerEffect(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        duration: const Duration(seconds: 1),
      ),
      justifyMultiLineText: true,
      textBoneBorderRadius: const TextBoneBorderRadius.fromHeightFactor(0.5),
      child: SliverGrid.count(
        crossAxisCount: 1,
        children: List.generate(
          10,
          (index) => const JobItem(),
          growable: false,
        ),
      ),
    );
  }
}
