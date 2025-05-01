// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_job_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddJobRequestBody _$AddJobRequestBodyFromJson(Map<String, dynamic> json) =>
    AddJobRequestBody(
      position: json['position'] as String,
      company: json['company'] as String,
      location: json['location'] as String,
      status: json['status'] as String,
      mode: json['mode'] as String,
    );

Map<String, dynamic> _$AddJobRequestBodyToJson(AddJobRequestBody instance) =>
    <String, dynamic>{
      'position': instance.position,
      'company': instance.company,
      'location': instance.location,
      'status': instance.status,
      'mode': instance.mode,
    };
