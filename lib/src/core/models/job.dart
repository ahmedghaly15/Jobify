import 'package:json_annotation/json_annotation.dart';

part 'job.g.dart';

@JsonSerializable()
class Job {
  final String position, company, location, status, mode;
  @JsonKey(name: 'created_at')
  final String createdAt;

  Job({
    required this.position,
    required this.company,
    required this.location,
    required this.status,
    required this.mode,
    required this.createdAt,
  });

  factory Job.fromJson(Map<String, dynamic> json) => _$JobFromJson(json);
  Map<String, dynamic> toJson() => _$JobToJson(this);
}
