import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../helpers/cache_helper.dart';
import '../helpers/cache_keys.dart';
import '../utils/constants.dart';
import '../utils/functions/check_for_first_launch_and_system_theme.dart';
import 'app_themes.dart';

final themeProvider =
    StateNotifierProvider.autoDispose<ThemeNotifier, ThemeData>(
      (ref) => ThemeNotifier(),
    );

final isDarkModeProvider = StateProvider.autoDispose<bool>((ref) {
  final theme = ref.watch(themeProvider);
  return theme.brightness == Brightness.dark;
});

class ThemeNotifier extends StateNotifier<ThemeData> {
  ThemeNotifier() : super(AppThemes.dark) {
    _retrieveCachedTheme();
  }

  Future<void> _cacheSelectedTheme(Brightness brightness) async {
    final themeIndex = brightness == Brightness.light ? 0 : 1;
    debugPrint('CACHED THEME INDEX: $themeIndex');
    await CacheHelper.setData(CacheKeys.theme, themeIndex);
  }

  void _retrieveCachedTheme() async {
    if (isFirstLaunch) {
      debugPrint('************ THIS IS OUR FIRST LAUNCH ************');
      _cacheSelectedTheme(
        isSystemDarkModeActive ? Brightness.dark : Brightness.light,
      );
      await CacheHelper.setData(CacheKeys.firstLaunch, false);
      state = isSystemDarkModeActive ? AppThemes.dark : AppThemes.light;
    } else {
      debugPrint('************ THIS IS NOT OUR FIRST LAUNCH ************');
      final cachedThemeIndex = await CacheHelper.getInt(CacheKeys.theme) ?? 0;
      final savedTheme =
          cachedThemeIndex == 0 ? AppThemes.light : AppThemes.dark;
      state = savedTheme;
    }
  }

  void toggle() async {
    if (isFirstLaunch) {
      await checkForFirstLaunchAndSystemTheme();
    }
    state =
        state.brightness == Brightness.light ? AppThemes.dark : AppThemes.light;
    _cacheSelectedTheme(state.brightness);
  }
}
