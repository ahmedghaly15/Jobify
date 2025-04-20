part of 'app_router.dart';

List<AutoRoute> appRoutes = [
  AutoRoute(initial: isOnboardingVisited == false, page: OnboardingRoute.page),
  _buildCustomRoute(
    initial: isOnboardingVisited,
    page: AuthRoute.page,
    children: [
      _buildCustomRoute(initial: true, page: LoginRoute.page),
      _buildCustomRoute(page: RegisterRoute.page),
      // _buildCustomRoute(page: OtpVerificationRoute.page),
    ],
  ),
];

CustomRoute _buildCustomRoute({
  bool initial = false,
  required PageInfo page,
  List<AutoRoute>? children,
  Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
  transitionsBuilder,
  int? durationInMilliseconds,
}) => CustomRoute(
  initial: initial,
  page: page,
  transitionsBuilder: transitionsBuilder ?? TransitionsBuilders.fadeIn,
  duration: Duration(milliseconds: durationInMilliseconds ?? 350),
  children: children,
);
