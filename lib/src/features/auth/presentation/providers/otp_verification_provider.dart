import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final pinputVerificationController = Provider.autoDispose(
  (ref) => TextEditingController(),
);
