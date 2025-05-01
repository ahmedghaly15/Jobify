import 'package:json_annotation/json_annotation.dart';

part 'add_job_request_body.g.dart';

@JsonSerializable()
class AddJobRequestBody {
  final String position, company, location, status, mode;

  AddJobRequestBody({
    required this.position,
    required this.company,
    required this.location,
    required this.status,
    required this.mode,
  });

  factory AddJobRequestBody.fromJson(Map<String, dynamic> json) =>
      _$AddJobRequestBodyFromJson(json);
  Map<String, dynamic> toJson() => _$AddJobRequestBodyToJson(this);
}
