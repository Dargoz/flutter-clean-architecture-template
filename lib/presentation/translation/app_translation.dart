import 'package:flutter_clean_architecture_template/presentation/translation/intl_en.dart';
import 'package:flutter_clean_architecture_template/presentation/translation/intl_id.dart';
import 'package:get/get.dart';

class AppTranslation extends Translations {
  static const String title = "title";
  static const String description = "description";
  static const String feedbackCategory = "feedbackCategory";
  static const String actualBehaviour = "actualBehaviour";
  static const String expectedBehaviour = "expectedBehaviour";
  static const String errorFeedback = "errorFeedback";
  static const String submit = "submit";

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enTranslation,
        'id_ID': idTranslation,
      };
}
