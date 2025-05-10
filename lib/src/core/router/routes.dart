part of 'app_router.dart';

List<AutoRoute> appRoutes = [
  AutoRoute(initial: isOnboardingVisited == false, page: OnboardingRoute.page),
  _buildCustomRoute(
    initial: !isUserLoggedIn && isOnboardingVisited,
    page: AuthRoute.page,
    children: [
      _buildCustomRoute(initial: true, page: LoginRoute.page),
      _buildCustomRoute(page: RegisterRoute.page),
      _buildCustomRoute(page: OtpVerificationRoute.page),
    ],
  ),
  _buildCustomRoute(
    initial: isUserLoggedIn && isOnboardingVisited,
    page: LayoutRoute.page,
    children: [
      _buildCustomRoute(page: AddJobRoute.page),
      _buildCustomRoute(page: SearchRoute.page),
      _buildCustomRoute(page: StatsRoute.page),
      _buildCustomRoute(page: HomeRoute.page),
    ],
  ),
  _buildCustomRoute(
    page: ProfileRoute.page,
    transitionsBuilder: TransitionsBuilders.slideRight,
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
  duration: Duration(milliseconds: durationInMilliseconds ?? 500),
  children: children,
);
