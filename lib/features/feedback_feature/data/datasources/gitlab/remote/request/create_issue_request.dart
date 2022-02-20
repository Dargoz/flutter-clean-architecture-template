import 'package:json_annotation/json_annotation.dart';

part 'create_issue_request.g.dart';

@JsonSerializable()
class CreateIssueRequest {
  CreateIssueRequest(
      {required this.title, this.description, required this.labels});

  String title;
  String? description;
  String? labels;

  factory CreateIssueRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateIssueRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateIssueRequestToJson(this);
}
