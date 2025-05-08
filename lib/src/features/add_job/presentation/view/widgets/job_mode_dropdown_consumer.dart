import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobify/src/core/helpers/extensions.dart';

import '../../../../../core/helpers/field_validator.dart';
import '../../../../../core/models/job.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_utils.dart';

class JobModeDropdownConsumer extends ConsumerWidget {
  const JobModeDropdownConsumer({super.key, required this.modeProvider});

  final AutoDisposeStateProvider<JobMode> modeProvider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DropdownButtonFormField<JobMode>(
      decoration: AppUtils.decorateTextField(hintText: AppStrings.mode),
      validator: (value) => FieldValidator.validatingEmptyField(value?.name),
      value: ref.watch(modeProvider),
      items:
          JobMode.values
              .map(
                (mode) =>
                    DropdownMenuItem(value: mode, child: Text(mode.enumName)),
              )
              .toList(),
      onChanged: (selectedItem) {
        ref.read(modeProvider.notifier).state = selectedItem!;
      },
    );
  }
}
