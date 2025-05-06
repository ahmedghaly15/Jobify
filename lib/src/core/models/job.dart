import 'package:json_annotation/json_annotation.dart';

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

@JsonEnum()
enum JobStatus {
  @JsonValue('Pending')
  pending,
  @JsonValue('Interview')
  interview,
  @JsonValue('Declined')
  declined,
}

@JsonEnum()
enum JobMode {
  @JsonValue('Full Time')
  fullTime,
  @JsonValue('Part Time')
  partTime,
  @JsonValue('Freelance')
  freelance,
  @JsonValue('Internship')
  internship,
}
