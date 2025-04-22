// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/models/jobify_user.dart';
import '../../data/models/auth_request_params.dart';
import '../../data/repos/auth_repo.dart';
import 'form_notifier_providers.dart';

part 'register_providers.g.dart';

final registerFormKeyProvider = Provider.autoDispose<GlobalKey<FormState>>(
  (ref) => GlobalKey<FormState>(),
);
final registerNameControllerProvider =
    Provider.autoDispose<TextEditingController>(
      (ref) => TextEditingController(),
    );
final registerEmailControllerProvider =
    Provider.autoDispose<TextEditingController>(
      (ref) => TextEditingController(),
    );
final registerPassControllerProvider =
    Provider.autoDispose<TextEditingController>(
      (ref) => TextEditingController(),
    );
final registerConfirmPassControllerProvider =
    Provider.autoDispose<TextEditingController>(
      (ref) => TextEditingController(),
    );
final registerEmailFocusNodeProvider = Provider.autoDispose<FocusNode>(
  (ref) => FocusNode(),
);
final registerPassFocusNodeProvider = Provider.autoDispose<FocusNode>(
  (ref) => FocusNode(),
);
final registerConfirmPassFocusNodeProvider = Provider.autoDispose<FocusNode>(
  (ref) => FocusNode(),
);
final registerPassObscureTextProvider =
    StateNotifierProvider.autoDispose<ToggleBoolNotifier, bool>(
      (ref) => ToggleBoolNotifier(),
    );
final confirmPassObscureTextProvider =
    StateNotifierProvider.autoDispose<ToggleBoolNotifier, bool>(
      (ref) => ToggleBoolNotifier(),
    );

@riverpod
class Register extends _$Register {
  @override
  AsyncValue<JobifyUser>? build() {
    return null;
  }

  void _register() async {
    state = const AsyncLoading();
    final result = await ref
        .read(registerRepoProvider)
        .auth(
          AuthRequestParams(
            email: ref.read(registerEmailControllerProvider).text.trim(),
            password: ref.read(registerPassControllerProvider).text,
            name: ref.read(registerNameControllerProvider).text.trim(),
          ),
        );
    result.when(
      success: (jobifyUser) => state = AsyncData(jobifyUser),
      failure: (error) => state = AsyncError(error.message, StackTrace.current),
    );
  }

  void validateFormAndRegister() {
    final formKey = ref.read(registerFormKeyProvider);
    if (formKey.currentState!.validate()) {
      _register();
    } else {
      ref.read(registerAutovalidateModeProvider.notifier).enableAutoValidate();
    }
  }
}
