import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobify/src/core/helpers/extensions.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../../core/utils/enums.dart';
import '../../providers/search_providers.dart';

class SearchFilterDropdownConsumer extends ConsumerWidget {
  const SearchFilterDropdownConsumer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DropdownButton<SearchFilter>(
      icon: const LucideIconWidget(LucideIcons.chevronDown),
      underline: const SizedBox.shrink(),
      items:
          SearchFilter.values
              .map(
                (filter) => DropdownMenuItem(
                  value: filter,
                  child: Text(filter.name.capitalize()),
                ),
              )
              .toList(),
      value: ref.watch(filterStateProvider),
      onChanged: (selectedFilterState) {
        ref.read(filterStateProvider.notifier).state = selectedFilterState!;
      },
    );
  }
}
