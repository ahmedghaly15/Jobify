import '../models/jobify_user.dart';
import 'app_strings.dart';

bool isOnboardingVisited = false;
bool isUserLoggedIn = false;
JobifyUser? currentUser;

class AppConstants {
  AppConstants._();

  static const List<String> jobStatus = [
    AppStrings.pending,
    AppStrings.interview,
    AppStrings.declined,
  ];

  static const List<String> jobMode = [
    AppStrings.fullTime,
    AppStrings.partTime,
    AppStrings.freelance,
    AppStrings.internship,
  ];
}
