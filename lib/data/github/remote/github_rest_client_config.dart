import 'package:flutter_clean_architecture_template/data/github/remote/interceptor/github_http_interceptor.dart';
import 'package:dio/dio.dart';

abstract class GithubRestClientConfig {
  static final Dio dio = Dio()..interceptors.add(GithubHttpInterceptor());

}
