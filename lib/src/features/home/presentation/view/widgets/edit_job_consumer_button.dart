import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:jobify/src/core/helpers/extensions.dart';

import '../../../../../core/models/job.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/primary_button.dart';
import '../../providers/home_providers.dart';

class EditJobConsumerButton extends ConsumerWidget {
  const EditJobConsumerButton({super.key, required this.job});

  final Job job;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PrimaryButton(
      onPressed: () {
        print(ref.read(editJobPositionControllerProvider(job.position!)).text);
        print(ref.read(editJobCompanyControllerProvider(job.company!)).text);
        print(ref.read(editJobLocationControllerProvider(job.location!)).text);
        print(ref.read(editJobModeProvider(job.mode!)).enumName);
        print(ref.read(editJobStatusProvider(job.status!)).enumName);
      },
      text: AppStrings.editJob,
    );
  }
}
