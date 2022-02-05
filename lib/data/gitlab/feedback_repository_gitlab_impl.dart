import 'package:flutter_clean_architecture_template/data/core/remote/rest_client_configuration.dart';
import 'package:flutter_clean_architecture_template/data/gitlab/remote/service/gitlab_rest_api_client.dart';
import 'package:injectable/injectable.dart';

import '../../domain/feedback/entities/issue.dart';
import '../../domain/feedback/i_feedback_repository.dart';

@Named("gitlab")
@Singleton(as: IFeedbackRepository)
class FeedbackRepositoryGitlabImpl extends IFeedbackRepository {
  final GitlabRestApiClient _gitlabRestApiService =
      GitlabRestApiClient(RestClientConfiguration.dio);

  @override
  Future createAndIssue(Issue issue) async {
    final response = await _gitlabRestApiService.createAndIssue(issue);
    return response;
  }
}
