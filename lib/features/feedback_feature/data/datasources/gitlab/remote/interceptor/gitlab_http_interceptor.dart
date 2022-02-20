import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../gitlab_constants.dart';

class GitlabHttpInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (kDebugMode) {
      print('REQUEST[${options.method}] => PATH: ${options.path} , '
          'baseUrl : ${options.baseUrl} entity : ${options.data}');
    }

    options.headers['Authorization'] = 'Bearer $gitlabToken';

    if (kDebugMode) {
      print('header : ${options.headers} entity : ${options.data}');
    }
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (kDebugMode) {
      print(
          'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
      print('RESPONSE[${response.statusCode}] => BODY:\n ${response.data}');
    }
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (kDebugMode) {
      print('ERROR[${err.response?.statusCode}] => '
          'PATH: ${err.requestOptions.path} data: ${err.requestOptions.data}');
    }
    // TODO: handle network error
    switch (err.response?.statusCode) {
      case 403:
      case 500:
      default:
        super.onError(err, handler);
        break;
    }
  }
}
