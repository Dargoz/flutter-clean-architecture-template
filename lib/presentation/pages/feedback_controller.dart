import 'package:flutter/foundation.dart';
import 'package:flutter_clean_architecture_template/domain/core/entities/error_schema.dart';
import 'package:flutter_clean_architecture_template/domain/core/entities/status.dart';
import 'package:flutter_clean_architecture_template/domain/core/usecases/usecase.dart';
import 'package:flutter_clean_architecture_template/domain/feedback/entities/issue.dart';
import 'package:flutter_clean_architecture_template/domain/feedback/usecase/bug_use_case.dart';
import 'package:flutter_clean_architecture_template/injection.dart';
import 'package:get/get.dart';

class FeedbackController extends GetxController {
  UseCase _bugUseCase = getIt<BugUseCase>();
  UseCase _improvementUseCase = getIt<BugUseCase>();

  var status = Status.initial.obs;
  var showError = false.obs;
  var issue = Issue(title: '').obs;

  Future<void> submit() async {
    if (kDebugMode) {
      print(issue.toString());
    }
    if (issue.value.title.isEmpty) {
      showError.value = true;
    } else {
      status.value = Status.loading;
      var result = await _bugUseCase.executeUseCase(issue.value);
      if(result is ErrorSchema) {
        status.value = Status.error;
      } else {
        status.value = Status.success;
      }
    }
  }

  void backOnError() {
    status.value = Status.initial;
  }
}
