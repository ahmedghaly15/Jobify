import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobify/src/core/helpers/extensions.dart';

import '../../../../../core/helpers/field_validator.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_utils.dart';
import '../../../../../core/utils/enums.dart';
import '../../providers/add_job_provider.dart';

class JobModeDropdownConsumer extends ConsumerWidget {
  const JobModeDropdownConsumer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DropdownButtonFormField<JobMode>(
      decoration: AppUtils.decorateTextField(hintText: AppStrings.mode),
      validator: (value) => FieldValidator.validatingEmptyField(value?.name),
      value: ref.watch(modeProvider),
      items:
          JobMode.values
              .map(
                (mode) => DropdownMenuItem(
                  value: mode,
                  child: Text(mode.name.capitalize()),
                ),
              )
              .toList(),
      onChanged: (selectedItem) {
        ref.read(modeProvider.notifier).state = selectedItem!;
      },
    );
  }
}
