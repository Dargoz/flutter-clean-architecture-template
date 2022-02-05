
import 'package:flutter_clean_architecture_template/domain/feedback/entities/issue.dart';

abstract class IFeedbackRepository {

  Future createAndIssue(Issue issue);

}