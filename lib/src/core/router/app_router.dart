import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/auth/presentation/views/login_view.dart';
import '../../features/auth/presentation/views/otp_verification_view.dart';
import '../../features/auth/presentation/views/register_view.dart';
import '../../features/add_job/presentation/view/add_job_view.dart';
import '../../features/layout/presentation/view/layout_view.dart';
import '../../features/onboarding/presentation/view/onboarding_view.dart';
import '../../features/profile/presentation/view/profile_view.dart';
import '../../features/search/presentation/view/search_view.dart';
import '../../features/stats/presentation/view/stats_view.dart';
import '../utils/constants.dart';

part 'app_router.gr.dart';
part 'routes.dart';

final appRouterProvider = Provider<AppRouter>((ref) => AppRouter());

@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes => appRoutes;
}

@RoutePage()
class AuthView extends AutoRouter {
  const AuthView({super.key});
}
