import 'package:flutter/foundation.dart';

import '../../helpers/cache_helper.dart';
import '../../helpers/cache_keys.dart';
import '../constants.dart';

void checkForFirstLaunchAndSystemTheme() async {
  final cachedFirstLaunch = await CacheHelper.getBool(CacheKeys.firstLaunch);
  if (cachedFirstLaunch == null) {
    isFirstLaunch = true;
    await CacheHelper.setData(CacheKeys.firstLaunch, true);
    _checkTheDeviceTheme();
  } else {
    isFirstLaunch = false;
  }
}

void _checkTheDeviceTheme() {
  final brightness = PlatformDispatcher.instance.platformBrightness;
  isSystemDarkModeActive = brightness == Brightness.dark;
}
