import 'package:jobify/src/core/helpers/extensions.dart';

import '../../helpers/cache_helper.dart';
import '../../helpers/cache_keys.dart';
import '../../models/jobify_user.dart';
import '../constants.dart';

Future<void> checkIfIsUserLoggedIn() async {
  final cachedUser = await CacheHelper.getSecuredString(CacheKeys.user);
  if (cachedUser.isNullOrEmpty) {
    isUserLoggedIn = false;
  } else {
    currentUser = await JobifyUser.getSecuredUser();
    isUserLoggedIn = true;
  }
}
