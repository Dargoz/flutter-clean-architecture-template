import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';

import '../../gitlab_constants.dart';
import '../responses/issue_response.dart';
import '../request/create_issue_request.dart';

part 'gitlab_rest_api_client.g.dart';

@RestApi(baseUrl: 'https://gitlab.com/api/v4/')
abstract class GitlabRestApiClient {
  factory GitlabRestApiClient(Dio dio, {String baseUrl}) = _GitlabRestApiClient;

  @POST('projects/$gitlabProjectId/issues')
  Future<IssueResponse> createAndIssue(@Body() CreateIssueRequest issue);
}
