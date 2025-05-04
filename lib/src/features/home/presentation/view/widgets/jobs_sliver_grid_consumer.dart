import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'job_item.dart';

class JobsSliverGridConsumer extends StatelessWidget {
  const JobsSliverGridConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: 10,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        mainAxisSpacing: 16.h,
        crossAxisSpacing: 8.w,
      ),
      itemBuilder:
          (_, index) =>
              const JobItem()
                  .animate()
                  .fadeIn(duration: const Duration(milliseconds: 500))
                  .scale(),
    );
  }
}
