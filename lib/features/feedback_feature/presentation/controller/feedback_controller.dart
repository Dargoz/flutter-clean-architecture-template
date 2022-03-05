import 'package:flutter/foundation.dart';
import 'package:flutter_clean_architecture_template/injection.dart';
import 'package:get/get.dart';

import '../../../../core/entities/error_schema.dart';
import '../../../../core/entities/status.dart';
import '../../../../core/usecases/usecase.dart';

import '../../domain/entities/label.dart';
import '../../domain/usecases/bug_use_case.dart';
import '../../domain/usecases/improvement_use_case.dart';

import '../utils/data_mapper.dart';
import 'feedback_model.dart';

class FeedbackController extends GetxController {
  final UseCase _bugUseCase = getIt<BugUseCase>();
  final UseCase _improvementUseCase = getIt<ImprovementUseCase>();

  var status = Status.initial.obs;
  var showError = false.obs;
  var label = Label.bug.name.obs;
  var issue = FeedbackModel(title: '').obs;
  var errorMessage = "";

  Future<void> submit() async {
    if (kDebugMode) {
      print(issue.toString());
    }
    if (issue.value.title.isEmpty) {
      showError.value = true;
    } else {
      status.value = Status.loading;
      dynamic result;
      if (label.value == Label.bug.name) {
        result =
            await _bugUseCase.executeUseCase(issue.value.toIssue());
      } else if (label.value == Label.improvement.name) {
        result = await _improvementUseCase
            .executeUseCase(issue.value.toIssue());
      }

      if (result is ErrorSchema) {
        errorMessage = result.message ?? "";
        if (kDebugMode) {
          print("errorMessage : ${result.statusCode} -> $errorMessage");
        }
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
