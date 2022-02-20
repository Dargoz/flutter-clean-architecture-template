import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_template/features/feedback_feature/presentation/widgets/feedback_widget.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feeback'),
      ),
      body: FeedbackWidget(),
    );
  }
}
