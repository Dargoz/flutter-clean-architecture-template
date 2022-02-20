import 'package:injectable/injectable.dart';

import '../datasources/gitlab/remote/gitlab_rest_client_config.dart';
import '../datasources/gitlab/remote/service/gitlab_rest_api_client.dart';
import '../datasources/gitlab/utils/gitlab_mapper.dart';

import '../../domain/entities/issue.dart';
import '../../domain/repositories/i_feedback_repository.dart';

@Named("gitlab")
@Singleton(as: IFeedbackRepository)
class FeedbackRepositoryGitlabImpl extends IFeedbackRepository {
  final GitlabRestApiClient _gitlabRestApiService =
      GitlabRestApiClient(GitlabRestClientConfig.dio);

  @override
  Future createAndIssue(Issue issue) async {
    final response = await _gitlabRestApiService
        .createAndIssue(GitlabMapper.fromIssue(issue));
    return response;
  }
}
