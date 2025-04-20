import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'jobify_user.g.dart';
part 'jobify_user.freezed.dart';

@freezed
abstract class JobifyUser with _$JobifyUser {
  @JsonSerializable(explicitToJson: true)
  const factory JobifyUser({
    @SessionJsonConverter() Session? session,
    @UserJsonConverter() User? user,
    String? name,
    String? createdAt,
  }) = _JobifyUser;

  factory JobifyUser.fromJson(Map<String, dynamic> json) =>
      _$JobifyUserFromJson(json);
}

class SessionJsonConverter
    extends JsonConverter<Session?, Map<String, dynamic>> {
  const SessionJsonConverter();

  @override
  Session? fromJson(Map<String, dynamic> json) {
    return Session.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(Session? session) {
    return session?.toJson() ?? {};
  }
}

class UserJsonConverter extends JsonConverter<User?, Map<String, dynamic>> {
  const UserJsonConverter();

  @override
  User? fromJson(Map<String, dynamic> json) {
    return User.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(User? user) {
    return user?.toJson() ?? {};
  }
}
