import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobify/src/core/helpers/extensions.dart';

import '../../../../../core/helpers/field_validator.dart';
import '../../../../../core/models/job.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_utils.dart';

class JobStatusDropdownConsumer extends ConsumerWidget {
  const JobStatusDropdownConsumer({super.key, required this.statusProvider});

  final AutoDisposeStateProvider<JobStatus> statusProvider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DropdownButtonFormField<JobStatus>(
      decoration: AppUtils.decorateTextField(hintText: AppStrings.status),
      validator: (value) => FieldValidator.validatingEmptyField(value?.name),
      value: ref.watch(statusProvider),
      items:
          JobStatus.values
              .map(
                (status) => DropdownMenuItem(
                  value: status,
                  child: Text(status.enumName),
                ),
              )
              .toList(),
      onChanged: (selectedItem) {
        ref.read(statusProvider.notifier).state = selectedItem!;
      },
    );
  }
}
