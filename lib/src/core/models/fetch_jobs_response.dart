import 'package:json_annotation/json_annotation.dart';

import 'job.dart';

part 'fetch_jobs_response.g.dart';

@JsonSerializable(explicitToJson: true)
class FetchJobsResponse {
  final List<Job> jobs;

  FetchJobsResponse({required this.jobs});

  factory FetchJobsResponse.fromJson(Map<String, dynamic> json) =>
      _$FetchJobsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$FetchJobsResponseToJson(this);
}
