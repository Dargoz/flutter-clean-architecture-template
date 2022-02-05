import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_clean_architecture_template/domain/core/entities/error_schema.dart';

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
      response = ErrorSchema(
          dioError.response?.statusCode, dioError.response?.statusMessage);
      return response;
    } catch (error) {
      return response;
    }
  }
}
