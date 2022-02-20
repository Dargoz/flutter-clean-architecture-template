import '../../../../domain/entities/issue.dart';
import '../remote/request/create_issue_request.dart';

class GithubMapper {
  static CreateIssueRequest fromIssue(Issue issue) {
    return CreateIssueRequest(
        title: issue.title,
        body: issue.body,
        assignee: issue.assignee,
        labels: issue.labels?.split(",") ?? []);
  }
}
