// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/utils/constants.dart';
import '../../../auth/presentation/providers/form_notifier_providers.dart';
import '../../data/models/update_profile_params.dart';
import '../../data/repo/profile_repo.dart';

part 'profile_providers.g.dart';

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

final profilePassControllerProvider =
    Provider.autoDispose<TextEditingController>(
      (ref) => TextEditingController(
        text: currentUser?.user?.userMetadata?['password'],
      ),
    );

final profilePassObscureTextProvider =
    StateNotifierProvider.autoDispose<ToggleBoolNotifier, bool>(
      (ref) => ToggleBoolNotifier(),
    );

final isUpdateProfileButtonEnabledProvider = StateProvider.autoDispose<bool>((
  ref,
) {
  final emailController = ref.watch(profileEmailControllerProvider);
  final nameController = ref.watch(profileNameControllerProvider);
  final passController = ref.watch(profilePassControllerProvider);
  return emailController.text != currentUser?.user?.email ||
      nameController.text != currentUser?.name ||
      nameController.text.isNotEmpty ||
      passController.text.isNotEmpty;
});

@riverpod
class UpdateProfile extends _$UpdateProfile {
  @override
  AsyncValue<void>? build() {
    return null;
  }

  void _update() async {
    state = const AsyncLoading();
    final result = await ref
        .read(profileRepoProvider)
        .updateProfile(
          UpdateProfileParams(
            email: ref.read(profileEmailControllerProvider).text,
            password: ref.read(profilePassControllerProvider).text,
            data: {'name': ref.read(profileNameControllerProvider).text},
          ),
        );
    result.when(
      success: (_) => state = const AsyncData(null),
      failure: (error) => state = AsyncError(error.message, StackTrace.current),
    );
  }

  void validateFormAndUpdate() {
    final formKey = ref.read(profileFormKeyProvider);
    if (formKey.currentState!.validate()) {
      _update();
    } else {
      ref.read(profileAutovalidateModeProvider.notifier).enableAutoValidate();
    }
  }
}
