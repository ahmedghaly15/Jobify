import 'package:freezed_annotation/freezed_annotation.dart';

part 'job.g.dart';
part 'job.freezed.dart';

@freezed
class Job with _$Job {
  @JsonSerializable()
  const factory Job({
    required int id,
    String? position,
    String? company,
    String? location,
    JobMode? mode,
    JobStatus? status,
    @JsonKey(name: 'created_at') String? createdAt,
  }) = _Job;

  factory Job.fromJson(Map<String, dynamic> json) => _$JobFromJson(json);
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
