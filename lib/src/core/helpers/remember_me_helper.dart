import 'cache_helper.dart';
import 'cache_keys.dart';

class RememberMeHelper {
  RememberMeHelper._();

  static Future<String?> getRememberedPass() async =>
      await CacheHelper.getSecuredString(CacheKeys.rememberedPassword);

  static Future<String?> getRememberedEmail() async =>
      await CacheHelper.getSecuredString(CacheKeys.rememberedEmail);

  static Future<void> handleRememberingEmailAndPassword({
    required bool isRemembered,
    required String emailValue,
    required String passwordValue,
  }) async {
    if (isRemembered) {
      await _rememberEmailAndPassword(
        emailValue: emailValue,
        passwordValue: passwordValue,
      );
    } else {
      await _deleteRememberedEmailAndPassword();
    }
  }

  static Future<void> _rememberEmailAndPassword({
    required String emailValue,
    required String passwordValue,
  }) async {
    await CacheHelper.setSecuredString(CacheKeys.rememberedEmail, emailValue);
    await CacheHelper.setSecuredString(
      CacheKeys.rememberedPassword,
      passwordValue,
    );
  }

  static Future<void> _deleteRememberedEmailAndPassword() async {
    await CacheHelper.removeSecuredData(CacheKeys.rememberedEmail);
    await CacheHelper.removeSecuredData(CacheKeys.rememberedPassword);
  }
}
