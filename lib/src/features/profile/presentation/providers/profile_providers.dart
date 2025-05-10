import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/utils/constants.dart';
import '../../../auth/presentation/providers/form_notifier_providers.dart';

final profileAutovalidateModeProvider = StateNotifierProvider.autoDispose<
  AutovalidateModeNotifier,
  AutovalidateMode
>((ref) => AutovalidateModeNotifier());
final profileFormKeyProvider = Provider.autoDispose<GlobalKey<FormState>>(
  (ref) => GlobalKey<FormState>(),
);
final profileEmailControllerProvider =
    Provider.autoDispose<TextEditingController>(
      (ref) => TextEditingController(text: currentUser?.user?.email),
    );
final profileNameControllerProvider =
    Provider.autoDispose<TextEditingController>(
      (ref) => TextEditingController(text: currentUser?.name),
    );
final isUpdateProfileButtonEnabledProvider = StateProvider.autoDispose<bool>((
  ref,
) {
  final emailController = ref.watch(profileEmailControllerProvider);
  final nameController = ref.watch(profileNameControllerProvider);
  return emailController.text != currentUser?.user?.email ||
      nameController.text != currentUser?.name;
});
