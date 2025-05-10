// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/models/jobify_user.dart';
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

final profilePassObscureTextProvider =
    StateNotifierProvider.autoDispose<ToggleBoolNotifier, bool>(
      (ref) => ToggleBoolNotifier(),
    );

final profileEmailTextProvider = StateProvider.autoDispose<String>(
  (ref) => currentUser?.user?.email ?? '',
);

final profileNameTextProvider = StateProvider.autoDispose<String>(
  (ref) => currentUser?.user?.userMetadata?['name'] ?? '',
);

final profilePassTextProvider = StateProvider.autoDispose<String>((ref) => '');

final isUpdateProfileButtonEnabledProvider = StateProvider.autoDispose<bool>((
  ref,
) {
  final email = ref.watch(profileEmailTextProvider);
  final name = ref.watch(profileNameTextProvider);
  final pass = ref.watch(profilePassTextProvider);

  final currentEmail = currentUser?.user?.email ?? '';
  final currentName = currentUser?.user?.userMetadata?['name'] ?? '';

  return email.trim() != currentEmail ||
      name.trim() != currentName ||
      pass.trim().isNotEmpty;
});

@riverpod
class UpdateProfile extends _$UpdateProfile {
  @override
  AsyncValue<JobifyUser>? build() {
    return null;
  }

  void _update() async {
    state = const AsyncLoading();
    final result = await ref
        .read(profileRepoProvider)
        .updateProfile(
          UpdateProfileParams(
            email: ref.read(profileEmailTextProvider),
            password:
                ref.read(profilePassTextProvider) == ''
                    ? null
                    : ref.read(profilePassTextProvider),
            data: {'name': ref.read(profileNameTextProvider)},
          ),
        );
    result.when(
      success: (jobifyUser) => state = AsyncData(jobifyUser),
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
