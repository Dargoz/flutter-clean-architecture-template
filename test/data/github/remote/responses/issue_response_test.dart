import 'package:flutter_clean_architecture_template/features/feedback_feature/domain/entities/issue.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('issue response test', () {
    var issue = Issue(title: 'asd');
    print('issue : ${issue.toJson()}');
  });
}
