import 'package:flutter_clean_architecture_template/domain/feedback/entities/issue.dart';
import 'package:flutter_clean_architecture_template/presentation/pages/feedback/feedback_model.dart';

class DataMapper {
  static Issue fromModel(FeedbackModel model) {
    return Issue(
        title: model.title,
        body: model.description,
        actualBehaviour: model.actualBehaviour,
        expectedBehaviour: model.expectedBehaviour);
  }
}
