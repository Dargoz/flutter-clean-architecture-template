import '../remote/request/create_issue_request.dart';
import '../../../../domain/entities/issue.dart';

class GitlabMapper {
  static CreateIssueRequest fromIssue(Issue issue) {
    return CreateIssueRequest(
        title: issue.title,
        description:
        issue.body,
        labels: issue.labels);
  }
}
