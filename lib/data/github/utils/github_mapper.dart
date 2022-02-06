import 'package:flutter_clean_architecture_template/data/github/remote/request/create_issue_request.dart';
import 'package:flutter_clean_architecture_template/domain/feedback/entities/issue.dart';

class GithubMapper {
  static CreateIssueRequest fromIssue(Issue issue) {
    return CreateIssueRequest(
        title: issue.title,
        body: issue.body,
        assignee: issue.assignee,
        labels: issue.labels?.split(",") ?? []);
  }
}
