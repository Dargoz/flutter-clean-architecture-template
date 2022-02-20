import 'package:injectable/injectable.dart';

import '../../../../core/usecases/usecase.dart';
import '../entities/issue.dart';
import '../repositories/i_feedback_repository.dart';

@injectable
class BugUseCase extends UseCase<dynamic, Issue> {
  BugUseCase(@Named('gitlab') this._repository);

  final IFeedbackRepository _repository;

  @override
  Future useCase(Issue params) {
    params.title = '[BUG] ' + params.title;
    params.labels = 'bug';
    params.body = generateBodyFormat(
        '',
        params.expectedBehaviour ?? '',
        params.actualBehaviour ?? '');
    return _repository.createAndIssue(params);
  }

  String generateBodyFormat(
      String stepToReproduce, String expected, String actual) {
    return '### 📝 Step to reproduce\n'
        '$stepToReproduce\n'
        '### ✔️ Expected behaviour\n'
        '$expected\n'
        '### ❌ Actual behaviour\n'
        '$actual\n';
  }
}
