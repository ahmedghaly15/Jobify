import '../../helpers/cache_helper.dart';
import '../../helpers/cache_keys.dart';
import '../constants.dart';

Future<void> checkIfOnboardingIsVisited() async {
  final onboarding = await CacheHelper.getBool(CacheKeys.isOnboardingVisited);
  if (onboarding != null) {
    isOnboardingVisited = onboarding;
  } else {
    isOnboardingVisited = false;
  }
}
