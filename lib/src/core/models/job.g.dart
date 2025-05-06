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
  JobStatus.pending: 'Pending',
  JobStatus.interview: 'Interview',
  JobStatus.declined: 'Declined',
};

const _$JobModeEnumMap = {
  JobMode.fullTime: 'Full Time',
  JobMode.partTime: 'Part Time',
  JobMode.freelance: 'Freelance',
  JobMode.internship: 'Internship',
};
