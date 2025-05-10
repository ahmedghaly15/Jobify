import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../helpers/cache_helper.dart';
import '../helpers/cache_keys.dart';

part 'jobify_user.g.dart';
part 'jobify_user.freezed.dart';

@freezed
abstract class JobifyUser with _$JobifyUser {
  @JsonSerializable(explicitToJson: true)
  const factory JobifyUser({
    @_SessionJsonConverter() Session? session,
    @_UserJsonConverter() User? user,
    String? name,
  }) = _JobifyUser;

  factory JobifyUser.fromJson(Map<String, dynamic> json) =>
      _$JobifyUserFromJson(json);

  static Future<void> secureUser(JobifyUser user) async {
    await CacheHelper.setSecuredString(
      CacheKeys.user,
      json.encode(user.toJson()),
    );
  }

  static Future<JobifyUser> getSecuredUser() async {
    final userString = await CacheHelper.getSecuredString(CacheKeys.user);
    return JobifyUser.fromJson(json.decode(userString));
  }

  static Future<void> deleteSecuredUser() async {
    await CacheHelper.removeSecuredData(CacheKeys.user);
  }
}

class _SessionJsonConverter
    extends JsonConverter<Session?, Map<String, dynamic>> {
  const _SessionJsonConverter();

  @override
  Session? fromJson(Map<String, dynamic> json) {
    return Session.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(Session? session) {
    return session?.toJson() ?? {};
  }
}

class _UserJsonConverter extends JsonConverter<User?, Map<String, dynamic>> {
  const _UserJsonConverter();

  @override
  User? fromJson(Map<String, dynamic> json) {
    return User.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(User? user) {
    return user?.toJson() ?? {};
  }
}
