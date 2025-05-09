import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_search_text_field.dart';
import 'search_filter_dropdown_consumer.dart';

class CustomSearchSliverAppBar extends StatelessWidget {
  const CustomSearchSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Row(
        spacing: 16.w,
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Expanded(child: CustomSearchTextField()),
          SearchFilterDropdownConsumer(),
        ],
      ),
    );
  }
}
