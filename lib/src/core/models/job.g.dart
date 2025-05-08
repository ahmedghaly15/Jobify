// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$JobImpl _$$JobImplFromJson(Map<String, dynamic> json) => _$JobImpl(
  id: (json['id'] as num).toInt(),
  position: json['position'] as String?,
  company: json['company'] as String?,
  location: json['location'] as String?,
  mode: $enumDecodeNullable(_$JobModeEnumMap, json['mode']),
  status: $enumDecodeNullable(_$JobStatusEnumMap, json['status']),
  createdAt: json['created_at'] as String?,
);

Map<String, dynamic> _$$JobImplToJson(_$JobImpl instance) => <String, dynamic>{
  'id': instance.id,
  'position': instance.position,
  'company': instance.company,
  'location': instance.location,
  'mode': _$JobModeEnumMap[instance.mode],
  'status': _$JobStatusEnumMap[instance.status],
  'created_at': instance.createdAt,
};

const _$JobModeEnumMap = {
  JobMode.fullTime: 'Full Time',
  JobMode.partTime: 'Part Time',
  JobMode.freelance: 'Freelance',
  JobMode.internship: 'Internship',
};

const _$JobStatusEnumMap = {
  JobStatus.pending: 'Pending',
  JobStatus.interview: 'Interview',
  JobStatus.declined: 'Declined',
};
