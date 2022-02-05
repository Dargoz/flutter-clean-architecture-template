import 'package:flutter_clean_architecture_template/domain/core/usecases/usecase.dart';
import 'package:flutter_clean_architecture_template/domain/feedback/entities/issue.dart';
import 'package:injectable/injectable.dart';

import '../i_feedback_repository.dart';

@injectable
class ImprovementUseCase extends UseCase<dynamic, Issue> {
  ImprovementUseCase(@Named('gitlab') this._repository);

  final IFeedbackRepository _repository;

  @override
  Future useCase(Issue params) {
    return _repository.createAndIssue(params);
  }
}
