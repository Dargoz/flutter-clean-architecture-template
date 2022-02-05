import 'package:flutter_clean_architecture_template/domain/core/usecases/usecase.dart';
import 'package:flutter_clean_architecture_template/domain/feedback/entities/issue.dart';
import 'package:flutter_clean_architecture_template/domain/feedback/i_feedback_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class BugUseCase extends UseCase<dynamic, Issue> {
  BugUseCase(@Named('gitlab') this._repository);

  final IFeedbackRepository _repository;

  @override
  Future useCase(Issue params) {
    return _repository.createAndIssue(params);
  }
}
