import 'package:dio/dio.dart';

import 'interceptor/github_http_interceptor.dart';

abstract class GithubRestClientConfig {
  static final Dio dio = Dio()..interceptors.add(GithubHttpInterceptor());
}
