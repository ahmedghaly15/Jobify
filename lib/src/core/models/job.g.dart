// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Job _$JobFromJson(Map<String, dynamic> json) => Job(
  position: json['position'] as String?,
  company: json['company'] as String?,
  location: json['location'] as String?,
  status: $enumDecodeNullable(_$JobStatusEnumMap, json['status']),
  mode: $enumDecodeNullable(_$JobModeEnumMap, json['mode']),
  createdAt: json['created_at'] as String?,
);

Map<String, dynamic> _$JobToJson(Job instance) => <String, dynamic>{
  'position': instance.position,
  'company': instance.company,
  'location': instance.location,
  'mode': _$JobModeEnumMap[instance.mode],
  'status': _$JobStatusEnumMap[instance.status],
  'created_at': instance.createdAt,
};

const _$JobStatusEnumMap = {
  JobStatus.pending: 'pending',
  JobStatus.interview: 'interview',
  JobStatus.declined: 'declined',
};

const _$JobModeEnumMap = {
  JobMode.fullTime: 'fullTime',
  JobMode.partTime: 'partTime',
  JobMode.freelance: 'freelance',
  JobMode.internship: 'internship',
};
