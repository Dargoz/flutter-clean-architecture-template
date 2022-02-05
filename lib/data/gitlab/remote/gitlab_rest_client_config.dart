import 'package:flutter_clean_architecture_template/data/gitlab/remote/interceptor/gitlab_http_interceptor.dart';
import 'package:dio/dio.dart';

abstract class GitlabRestClientConfig {
  static final Dio dio = Dio()..interceptors.add(GitlabHttpInterceptor());
}
