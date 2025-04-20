// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jobify_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_JobifyUser _$JobifyUserFromJson(Map<String, dynamic> json) => _JobifyUser(
  session: const SessionJsonConverter().fromJson(
    json['session'] as Map<String, dynamic>,
  ),
  user: const UserJsonConverter().fromJson(
    json['user'] as Map<String, dynamic>,
  ),
  createdAt: json['createdAt'] as String?,
);

Map<String, dynamic> _$JobifyUserToJson(_JobifyUser instance) =>
    <String, dynamic>{
      'session': const SessionJsonConverter().toJson(instance.session),
      'user': const UserJsonConverter().toJson(instance.user),
      'createdAt': instance.createdAt,
    };
