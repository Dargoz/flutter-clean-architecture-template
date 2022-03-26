import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_clean_architecture_template/features/feedback_feature/presentation/widgets/feedback_widget.dart';
import 'package:flutter_clean_architecture_template/translation/app_translation.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppTranslation.pageTitle.tr),
      ),
      body: FeedbackWidget(accessToken: 'glpat-6VtJb2k-Ns8SXGApxzbb',),
    );
  }
}
