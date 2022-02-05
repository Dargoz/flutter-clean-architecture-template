import 'package:json_annotation/json_annotation.dart';

part 'task_completion_status_response.g.dart';

@JsonSerializable()
class TaskCompletionStatus {
  TaskCompletionStatus({
    this.count,
    this.completedCount,
  });

  int? count;
  int? completedCount;

  factory TaskCompletionStatus.fromJson(Map<String, dynamic> json) =>
      _$TaskCompletionStatusFromJson(json);

  Map<String, dynamic> toJson() => _$TaskCompletionStatusToJson(this);
}
