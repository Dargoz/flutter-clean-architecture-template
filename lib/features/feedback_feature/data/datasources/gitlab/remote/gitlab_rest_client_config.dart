import 'package:dio/dio.dart';
import 'interceptor/gitlab_http_interceptor.dart';

abstract class GitlabRestClientConfig {
  static final Dio dio = Dio()..interceptors.add(GitlabHttpInterceptor());
}
