
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';

import '../../remote/responses/issue_response.dart';
import '../../github_constants.dart';
import '../request/create_issue_request.dart';

part 'github_rest_api_client.g.dart';

@RestApi(baseUrl: 'https://api.github.com/')
abstract class GithubRestApiClient {

  factory GithubRestApiClient(Dio dio, {String baseUrl}) = _GithubRestApiClient;

  @POST('repos/$githubUser/$githubRepository/issues')
  Future<IssueResponse> createAndIssue(@Body() CreateIssueRequest issue);

}