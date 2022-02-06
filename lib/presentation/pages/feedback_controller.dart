import 'package:flutter/foundation.dart';
import 'package:flutter_clean_architecture_template/domain/core/entities/error_schema.dart';
import 'package:flutter_clean_architecture_template/domain/core/entities/status.dart';
import 'package:flutter_clean_architecture_template/domain/core/usecases/usecase.dart';
import 'package:flutter_clean_architecture_template/domain/feedback/entities/issue.dart';
import 'package:flutter_clean_architecture_template/domain/feedback/entities/label.dart';
import 'package:flutter_clean_architecture_template/domain/feedback/usecase/bug_use_case.dart';
import 'package:flutter_clean_architecture_template/domain/feedback/usecase/improvement_use_case.dart';
import 'package:flutter_clean_architecture_template/injection.dart';
import 'package:get/get.dart';

class FeedbackController extends GetxController {
  final UseCase _bugUseCase = getIt<BugUseCase>();
  final UseCase _improvementUseCase = getIt<ImprovementUseCase>();

  var status = Status.initial.obs;
  var showError = false.obs;
  var label = Label.bug.name.obs;
  var issue = Issue(title: '').obs;
  var errorMessage = "";

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
        errorMessage = result.message ?? "";
        print("errorMessage : ${result.statusCode} -> $errorMessage");
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
