import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'supabase_error_model.dart';

part 'supabase_request_result.freezed.dart';

final supabaseProvider = Provider((ref) => Supabase.instance.client);
final supabaseAuthProvider = Provider((ref) => ref.read(supabaseProvider).auth);

@freezed
abstract class SupabaseRequestResult<T> with _$SupabaseRequestResult<T> {
  const factory SupabaseRequestResult.success(T data) = Success<T>;
  const factory SupabaseRequestResult.failure(SupabaseErrorModel errorModel) =
      Failure<T>;
}
