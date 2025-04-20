import 'package:freezed_annotation/freezed_annotation.dart';

import 'supabase_error_model.dart';

part 'supabase_request_result.freezed.dart';

@freezed
abstract class SupabaseRequestResult<T> with _$SupabaseRequestResult<T> {
  const factory SupabaseRequestResult.success(T data) = Success<T>;
  const factory SupabaseRequestResult.failure(SupabaseErrorModel errorModel) =
      Failure<T>;
}
