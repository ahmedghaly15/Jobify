// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Job _$JobFromJson(Map<String, dynamic> json) => Job(
  position: json['position'] as String,
  company: json['company'] as String,
  location: json['location'] as String,
  status: json['status'] as String,
  mode: json['mode'] as String,
  createdAt: json['created_at'] as String?,
);

Map<String, dynamic> _$JobToJson(Job instance) => <String, dynamic>{
  'position': instance.position,
  'company': instance.company,
  'location': instance.location,
  'status': instance.status,
  'mode': instance.mode,
  'created_at': instance.createdAt,
};
