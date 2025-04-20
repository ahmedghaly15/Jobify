import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'app_provider_observer.dart';
import 'src/core/utils/const_strings.dart';
import 'src/core/utils/functions/check_if_onboarding_is_visited.dart';
import 'src/jobify_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // To fix texts being hidden bug in release mode
  await ScreenUtil.ensureScreenSize();
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top],
  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await dotenv.load();
  await Supabase.initialize(
    url: dotenv.env[ConstStrings.supabaseUrlKey]!,
    anonKey: dotenv.env[ConstStrings.supabaseAnonKey]!,
  );
  await checkIfOnboardingIsVisited();
  runApp(
    ProviderScope(observers: [AppProviderObserver()], child: const JobifyApp()),
  );
}
