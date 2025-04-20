import 'package:flutter/material.dart';

extension StringExtension on String? {
  bool get isNullOrEmpty => this == null || this == '';
}

extension RequestFocusOnFocusNode on BuildContext {
  void requestFocus(FocusNode node) => FocusScope.of(this).requestFocus(node);
}

extension UnfocusKeyboard on BuildContext {
  void unfocusKeyboard() => FocusScope.of(this).unfocus();
}
