import 'package:injectable/injectable.dart';

import '../../domain/entities/issue.dart';
import '../../domain/repositories/i_feedback_repository.dart';
import '../datasources/github/utils/github_mapper.dart';
import '../datasources/github/remote/github_rest_client_config.dart';
import '../datasources/github/remote/service/github_rest_api_client.dart';

@Named("github")
@Singleton(as: IFeedbackRepository)
class FeedbackRepositoryGithubImpl extends IFeedbackRepository {
  final GithubRestApiClient client =
      GithubRestApiClient(GithubRestClientConfig.dio);

  @override
  Future createAndIssue(Issue issue) async {
    print('create and issue $issue');
    final response = await client.createAndIssue(GithubMapper.fromIssue(issue));
    print('response : $response');
    return response;
  }
}
