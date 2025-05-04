import 'dart:math';

import 'constants.dart';

class SvgsManager {
  SvgsManager._();

  static String chooseRandomSvg() {
    final random = Random();
    final randomIndex = random.nextInt(AppConstants.jobSvgs.length);
    return AppConstants.jobSvgs[randomIndex];
  }
}
