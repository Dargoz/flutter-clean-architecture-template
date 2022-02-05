import 'package:flutter_clean_architecture_template/data/core/remote/rest_client_configuration.dart';
import 'package:flutter_clean_architecture_template/data/github/remote/service/github_rest_api_client.dart';
import 'package:flutter_clean_architecture_template/domain/feedback/entities/issue.dart';
import 'package:flutter_clean_architecture_template/domain/feedback/i_feedback_repository.dart';
import 'package:injectable/injectable.dart';

@Named("github")
@Singleton(as: IFeedbackRepository)
class FeedbackRepositoryGithubImpl extends IFeedbackRepository {
  final GithubRestApiClient client =
      GithubRestApiClient(RestClientConfiguration.dio);

  @override
  Future createAndIssue(Issue issue) async {
    print('create and issue $issue');
    final response = await client.createAndIssue(issue);
    print('response : $response');
    return response;
  }
}
