// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_jobs_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FetchJobsResponse _$FetchJobsResponseFromJson(Map<String, dynamic> json) =>
    FetchJobsResponse(
      jobs:
          (json['jobs'] as List<dynamic>)
              .map((e) => Job.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$FetchJobsResponseToJson(FetchJobsResponse instance) =>
    <String, dynamic>{'jobs': instance.jobs.map((e) => e.toJson()).toList()};
