import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../entities/error_schema.dart';

abstract class UseCase<Type, Params> {
  Future<Type> useCase(Params params);

  Future<Type> executeUseCase(Params params) async {
    dynamic response;
    try {
      response = await useCase(params);
      return response;
    } on DioError catch (dioError) {
      if (kDebugMode) {
        print(":: Got DioError ::");
        print(dioError.response);
      }
      var errorSchema = ErrorSchema.fromJson(dioError.response!.data);
      errorSchema.statusCode = dioError.response?.statusCode;
      response = errorSchema;
      return response;
    } on Exception catch (error) {
      response = ErrorSchema(99, error.toString());
      return response;
    }
  }
}
