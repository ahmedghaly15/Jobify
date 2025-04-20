import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'form_notifier_providers.dart';

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
