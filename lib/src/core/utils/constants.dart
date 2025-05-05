import '../models/jobify_user.dart';
import 'app_assets.dart';

bool isOnboardingVisited = false;
bool isUserLoggedIn = false;
JobifyUser? currentUser;

class AppConstants {
  AppConstants._();


  static const List<String> jobSvgs = [
    Assets.svgsJobOne,
    Assets.svgsJobTow,
    Assets.svgsJobThree,
    Assets.svgsJobFour,
    Assets.svgsJobFive,
  ];
}
