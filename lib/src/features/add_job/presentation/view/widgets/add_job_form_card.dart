import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'animated_add_job_form.dart';

class AddJobFormCard extends StatelessWidget {
  const AddJobFormCard({super.key});

  @override
  Widget build(BuildContext context) {

    return Card(
      elevation: 8.h,
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
        child: const AnimatedAddJobForm(),
      ),
    );
  }
}
