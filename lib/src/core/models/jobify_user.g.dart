// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jobify_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$JobifyUserImpl _$$JobifyUserImplFromJson(Map<String, dynamic> json) =>
    _$JobifyUserImpl(
      session: _$JsonConverterFromJson<Map<String, dynamic>, Session?>(
        json['session'],
        const _SessionJsonConverter().fromJson,
      ),
      user: _$JsonConverterFromJson<Map<String, dynamic>, User?>(
        json['user'],
        const _UserJsonConverter().fromJson,
      ),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$JobifyUserImplToJson(_$JobifyUserImpl instance) =>
    <String, dynamic>{
      'session': const _SessionJsonConverter().toJson(instance.session),
      'user': const _UserJsonConverter().toJson(instance.user),
      'name': instance.name,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);
