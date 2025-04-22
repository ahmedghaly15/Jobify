// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/models/jobify_user.dart';
import '../../data/models/auth_request_params.dart';
import '../../data/repos/auth_repo.dart';
import 'form_notifier_providers.dart';

part 'login_providers.g.dart';

final loginFormKeyProvider = Provider.autoDispose<GlobalKey<FormState>>(
  (ref) => GlobalKey<FormState>(),
);
final loginEmailControllerProvider =
    Provider.autoDispose<TextEditingController>(
      (ref) => TextEditingController(),
    );
final loginPassControllerProvider = Provider.autoDispose<TextEditingController>(
  (ref) => TextEditingController(),
);
final loginPassFocusNodeProvider = Provider.autoDispose<FocusNode>(
  (ref) => FocusNode(),
);
final loginPassObscureTextProvider =
    StateNotifierProvider.autoDispose<ToggleBoolNotifier, bool>(
      (ref) => ToggleBoolNotifier(),
    );
final checkboxValueProvider =
    StateNotifierProvider.autoDispose<ToggleBoolNotifier, bool>(
      (ref) => ToggleBoolNotifier(initial: false),
    );

@riverpod
class Login extends _$Login {
  @override
  AsyncValue<JobifyUser>? build() {
    return null;
  }

  void _login() async {
    state = const AsyncLoading();
    final result = await ref
        .read(loginRepoProvider)
        .auth(
          AuthRequestParams(
            email: ref.read(loginEmailControllerProvider).text,
            password: ref.read(loginPassControllerProvider).text,
          ),
        );
    state = result.when(
      success: (jobifyUser) => state = AsyncValue.data(jobifyUser),
      failure:
          (error) =>
              state = AsyncValue.error(error.message, StackTrace.current),
    );
  }

  void validateFormAndLogin() {
    final formKey = ref.read(loginFormKeyProvider);
    if (formKey.currentState!.validate()) {
      _login();
    } else {
      ref.read(loginAutovalidateModeProvider.notifier).enableAutoValidate();
    }
  }
}
