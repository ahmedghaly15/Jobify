part of 'app_router.dart';

List<AutoRoute> appRoutes = [
  AutoRoute(initial: isOnboardingVisited, page: OnboardingRoute.page),
  _buildCustomRoute(initial: !isOnboardingVisited, page: LoginRoute.page),
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
