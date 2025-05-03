import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/helpers/field_validator.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_utils.dart';
import '../../../../../core/utils/constants.dart';
import '../../providers/add_job_provider.dart';

class JobStatusDropdownConsumer extends ConsumerWidget {
  const JobStatusDropdownConsumer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DropdownButtonFormField<String>(
      decoration: AppUtils.decorateTextField(hintText: AppStrings.status),
      validator: (value) => FieldValidator.validatingEmptyField(value),
      items:
          AppConstants.jobStatus
              .map(
                (status) =>
                    DropdownMenuItem(value: status, child: Text(status)),
              )
              .toList(),
      onChanged: (selectedItem) {
        ref.read(statusProvider.notifier).state = selectedItem!;
      },
    );
  }
}
