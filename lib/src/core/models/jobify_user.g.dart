// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jobify_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_JobifyUser _$JobifyUserFromJson(Map<String, dynamic> json) => _JobifyUser(
  session: _$JsonConverterFromJson<Map<String, dynamic>, Session?>(
    json['session'],
    const SessionJsonConverter().fromJson,
  ),
  user: _$JsonConverterFromJson<Map<String, dynamic>, User?>(
    json['user'],
    const UserJsonConverter().fromJson,
  ),
  name: json['name'] as String?,
  createdAt: json['createdAt'] as String?,
);

Map<String, dynamic> _$JobifyUserToJson(_JobifyUser instance) =>
    <String, dynamic>{
      'session': const SessionJsonConverter().toJson(instance.session),
      'user': const UserJsonConverter().toJson(instance.user),
      'name': instance.name,
      'createdAt': instance.createdAt,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);
