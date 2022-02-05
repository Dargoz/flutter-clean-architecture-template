import 'package:json_annotation/json_annotation.dart';

part 'time_stats_response.g.dart';

@JsonSerializable()
class TimeStats {
  TimeStats({
    this.timeEstimate,
    this.totalTimeSpent,
    this.humanTimeEstimate,
    this.humanTotalTimeSpent,
  });

  int? timeEstimate;
  int? totalTimeSpent;
  int? humanTimeEstimate;
  int? humanTotalTimeSpent;

  factory TimeStats.fromJson(Map<String, dynamic> json) =>
      _$TimeStatsFromJson(json);

  Map<String, dynamic> toJson() => _$TimeStatsToJson(this);
}
