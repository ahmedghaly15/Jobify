import '../../network/internet_checker.dart';
import '../../supabase/supabase_error_handler.dart';
import '../../supabase/supabase_request_result.dart';
import '../app_strings.dart';

Future<SupabaseRequestResult<T>> executeAndHandleErrors<T>(
  Future Function() function,
) async {
  final internetChecker = InternetChecker.instance;
  if (await internetChecker.isConnected) {
    try {
      final response = await function();
      return SupabaseRequestResult<T>.success(response);
    } catch (error) {
      return SupabaseRequestResult.failure(
        SupabaseErrorHandler.handleError(error),
      );
    }
  } else {
    return SupabaseRequestResult.failure(
      SupabaseErrorHandler.handleError(AppStrings.noInternetConnection),
    );
  }
}
