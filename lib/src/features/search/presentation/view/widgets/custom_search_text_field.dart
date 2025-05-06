import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/helpers/debouncer.dart';
import '../../../../../core/helpers/field_validator.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../providers/search_providers.dart';

class CustomSearchTextField extends ConsumerWidget {
  const CustomSearchTextField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final debouncer = ref.watch(debouncerProvider);
    return CustomTextFormField(
      hintText: AppStrings.search,
      validating: (value) => FieldValidator.validatingEmptyField(value),
      onChanged: (value) {
        debouncer.run(() {
          ref.read(filteredSearchProvider(value).future);
        });
      },
    );
  }
}
