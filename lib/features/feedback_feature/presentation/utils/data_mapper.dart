import 'package:flutter_clean_architecture_template/features/feedback_feature/domain/entities/issue.dart';
import 'package:flutter_clean_architecture_template/features/feedback_feature/presentation/controller/feedback_model.dart';

class DataMapper {
  static Issue fromModel(FeedbackModel model) {
    return Issue(
        title: model.title,
        body: model.description,
        actualBehaviour: model.actualBehaviour,
        expectedBehaviour: model.expectedBehaviour);
  }
}
