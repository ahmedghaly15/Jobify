import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_provider_observer.dart';
import 'src/jobify_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // To fix texts being hidden bug in release mode
  await ScreenUtil.ensureScreenSize();
  runApp(
    ProviderScope(observers: [AppProviderObserver()], child: const JobifyApp()),
  );
}
