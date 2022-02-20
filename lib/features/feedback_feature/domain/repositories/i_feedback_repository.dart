
import 'package:flutter_clean_architecture_template/features/feedback_feature/domain/entities/issue.dart';

abstract class IFeedbackRepository {

  Future createAndIssue(Issue issue);

}