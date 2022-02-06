import 'package:flutter_clean_architecture_template/data/gitlab/remote/request/create_issue_request.dart';
import 'package:flutter_clean_architecture_template/domain/feedback/entities/issue.dart';

class GitlabMapper {
  static CreateIssueRequest fromIssue(Issue issue) {
    return CreateIssueRequest(
        title: issue.title,
        description: issue.body,
        labels: issue.labels);
  }
}
