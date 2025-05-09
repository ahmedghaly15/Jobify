import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/custom_sliver_app_bar.dart';
import '../../../../core/widgets/theme_icon_button_consumer.dart';
import 'widgets/add_job_consumer_button.dart';
import 'widgets/add_job_form_card.dart';

@RoutePage()
class AddJobView extends StatelessWidget {
  const AddJobView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
      child: CustomScrollView(
        slivers: [
          const CustomSliverAppBar(actions: [ThemeIconButtonConsumer()]),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 24.h,
              children: const [
                Spacer(),
                AddJobFormCard(),
                AddJobConsumerButton(),
                Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
