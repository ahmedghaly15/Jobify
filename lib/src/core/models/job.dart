import 'package:json_annotation/json_annotation.dart';

import '../utils/enums.dart';

part 'job.g.dart';


@JsonSerializable()
class Job {
  final String? position, company, location;
  final JobMode? mode;
  final JobStatus? status;
  @JsonKey(name: 'created_at')
  final String? createdAt;

  Job({
    this.position,
    this.company,
    this.location,
    this.status,
    this.mode,
    this.createdAt,
  });

  factory Job.fromJson(Map<String, dynamic> json) => _$JobFromJson(json);
  Map<String, dynamic> toJson() => _$JobToJson(this);
}
