import 'package:json_annotation/json_annotation.dart';
import 'assignee_response.dart';
import 'author_response.dart';
import 'links_response.dart';
import 'reference_response.dart';
import 'task_completion_status_response.dart';
import 'time_stats_response.dart';

part 'issue_response.g.dart';

@JsonSerializable()
class IssueResponse {
  IssueResponse({
    this.id,
    this.iid,
    this.projectId,
    this.title,
    this.description,
    this.state,
    this.createdAt,
    this.updatedAt,
    this.closedAt,
    this.closedBy,
    this.labels,
    this.milestone,
    this.assignees,
    this.author,
    this.type,
    this.assignee,
    this.userNotesCount,
    this.mergeRequestsCount,
    this.upvotes,
    this.downvotes,
    this.dueDate,
    this.confidential,
    this.discussionLocked,
    this.issueType,
    this.webUrl,
    this.timeStats,
    this.taskCompletionStatus,
    this.blockingIssuesCount,
    this.hasTasks,
    this.links,
    this.references,
    this.subscribed,
    this.movedToId,
    this.serviceDeskReplyTo,
  });

  int? id;
  int? iid;
  int? projectId;
  String? title;
  String? description;
  String? state;
  String? createdAt;
  String? updatedAt;
  String? closedAt;
  String? closedBy;
  List<String>? labels;
  String? milestone;
  List<Assignee>? assignees;
  Author? author;
  String? type;
  String? assignee;
  int? userNotesCount;
  int? mergeRequestsCount;
  int? upvotes;
  int? downvotes;
  String? dueDate;
  bool? confidential;
  bool? discussionLocked;
  String? issueType;
  String? webUrl;
  TimeStats? timeStats;
  TaskCompletionStatus? taskCompletionStatus;
  int? blockingIssuesCount;
  bool? hasTasks;
  @JsonKey(name: '_links')
  Links? links;
  References? references;
  bool? subscribed;
  int? movedToId;
  String? serviceDeskReplyTo;

  factory IssueResponse.fromJson(Map<String, dynamic> json) =>
      _$IssueResponseFromJson(json);

  Map<String, dynamic> toJson() => _$IssueResponseToJson(this);
}
