import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import 'src/core/helpers/colorful_printer.dart';

class AppRouterObserver extends AutoRouterObserver {
  final _logger = Logger(
    printer: ColorfulPrinter(type: ColorfulLogPrinterColor.pink),
  );

  @override
  void didPush(Route route, Route? previousRoute) {
    _logger.i('Previous route: ${previousRoute?.settings.name}');
    _logger.i('New route pushed: ${route.settings.name}');
    _logger.i('================================================');
    super.didPush(route, previousRoute);
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    _logger.i('Route Popped : ${route.settings.name}');
    _logger.i('================================================');
    super.didPop(route, previousRoute);
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    _logger.i('Route Removed : ${route.settings.name}');
    _logger.i('================================================');
    super.didRemove(route, previousRoute);
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    _logger.i(
      'OldRoute : ${oldRoute!.settings.name} was replaced by ${newRoute!.settings.name}',
    );
    _logger.i('================================================');
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
  }

  @override
  void didInitTabRoute(TabPageRoute route, TabPageRoute? previousRoute) {
    _logger.i('Tab route visited: ${route.name}');
    _logger.i('================================================');
    super.didInitTabRoute(route, previousRoute);
  }

  @override
  void didChangeTabRoute(TabPageRoute route, TabPageRoute previousRoute) {
    _logger.i('Tab route re-visited: ${route.name}');
    _logger.i('================================================');
    super.didChangeTabRoute(route, previousRoute);
  }
}
