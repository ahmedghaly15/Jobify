import 'package:supabase_flutter/supabase_flutter.dart';

import '../utils/app_strings.dart';
import 'supabase_error_code.dart';
import 'supabase_error_message.dart';
import 'supabase_error_model.dart';

class SupabaseErrorHandler {
  SupabaseErrorHandler._();

  static SupabaseErrorModel handleError(dynamic error) {
    if (error is AuthException) {
      return _handleAuthErrorFromCode(error.code);
    } else {
      return SupabaseErrorModel(message: error);
    }
  }

  static SupabaseErrorModel _handleAuthErrorFromCode(String? code) {
    switch (code) {
      case SupabaseErrorCode.emailAddressInvalid:
        return SupabaseErrorModel(
          message: SupabaseErrorMessage.emailAddressInvalid,
          code: code,
        );
      case SupabaseErrorCode.emailAddressNotAuthorized:
        return SupabaseErrorModel(
          message: SupabaseErrorMessage.emailAddressNotAuthorized,
          code: code,
        );
      case SupabaseErrorCode.emailExists:
        return SupabaseErrorModel(
          message: SupabaseErrorMessage.emailExists,
          code: code,
        );
      case SupabaseErrorCode.emailNotConfirmed:
        return SupabaseErrorModel(
          message: SupabaseErrorMessage.emailNotConfirmed,
          code: code,
        );
      case SupabaseErrorCode.invalidCredentials:
        return SupabaseErrorModel(
          message: SupabaseErrorMessage.invalidCredentials,
          code: code,
        );
      case SupabaseErrorCode.oAuthNotSupported:
        return SupabaseErrorModel(
          message: SupabaseErrorMessage.oAuthNotSupported,
          code: code,
        );
      case SupabaseErrorCode.otpExpired:
        return SupabaseErrorModel(
          message: SupabaseErrorMessage.otpExpired,
          code: code,
        );
      case SupabaseErrorCode.overEmailSendRateLimit:
        return SupabaseErrorModel(
          message: SupabaseErrorMessage.overEmailSendRateLimit,
          code: code,
        );
      case SupabaseErrorCode.overRequestRateLimit:
        return SupabaseErrorModel(
          message: SupabaseErrorMessage.overRequestRateLimit,
          code: code,
        );
      case SupabaseErrorCode.overSmsSendRateLimit:
        return SupabaseErrorModel(
          message: SupabaseErrorMessage.overSmsSendRateLimit,
          code: code,
        );
      case SupabaseErrorCode.phoneExists:
        return SupabaseErrorModel(
          message: SupabaseErrorMessage.phoneExists,
          code: code,
        );
      case SupabaseErrorCode.phoneNotConfirmed:
        return SupabaseErrorModel(
          message: SupabaseErrorMessage.phoneNotConfirmed,
          code: code,
        );
      case SupabaseErrorCode.reauthenticationNeeded:
        return SupabaseErrorModel(
          message: SupabaseErrorMessage.reauthenticationNeeded,
          code: code,
        );
      case SupabaseErrorCode.reauthenticationNotValid:
        return SupabaseErrorModel(
          message: SupabaseErrorMessage.reauthenticationNotValid,
          code: code,
        );
      case SupabaseErrorCode.refreshTokenNotFound:
        return SupabaseErrorModel(
          message: SupabaseErrorMessage.refreshTokenNotFound,
          code: code,
        );
      case SupabaseErrorCode.requestTimeout:
        return SupabaseErrorModel(
          message: SupabaseErrorMessage.requestTimeout,
          code: code,
        );
      case SupabaseErrorCode.sessionExpired:
        return SupabaseErrorModel(
          message: SupabaseErrorMessage.sessionExpired,
          code: code,
        );
      case SupabaseErrorCode.smsSendFailed:
        return SupabaseErrorModel(
          message: SupabaseErrorMessage.smsSendFailed,
          code: code,
        );
      case SupabaseErrorCode.userAlreadyExists:
        return SupabaseErrorModel(
          message: SupabaseErrorMessage.userAlreadyExists,
          code: code,
        );
      case SupabaseErrorCode.userNotFound:
        return SupabaseErrorModel(
          message: SupabaseErrorMessage.userNotFound,
          code: code,
        );
      case SupabaseErrorCode.weakPassword:
        return SupabaseErrorModel(
          message: SupabaseErrorMessage.weakPassword,
          code: code,
        );
      default:
        return SupabaseErrorModel(message: AppStrings.defaultError, code: code);
    }
  }
}
