import 'package:injectable/injectable.dart';

import '../../../../core/usecases/usecase.dart';
import '../entities/issue.dart';
import '../repositories/i_feedback_repository.dart';

@injectable
class ImprovementUseCase extends UseCase<dynamic, Issue> {
  ImprovementUseCase(@Named('gitlab') this._repository);

  final IFeedbackRepository _repository;

  @override
  Future useCase(Issue params) {
    params.title = '[IMPROVEMENT] ' + params.title;
    params.labels = 'improvement';
    return _repository.createAndIssue(params);
  }
}
