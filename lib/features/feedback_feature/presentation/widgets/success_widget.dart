import 'package:flutter/material.dart';

class SuccessWidget extends StatelessWidget {
  const SuccessWidget({Key? key, required this.userAction}) : super(key: key);

  final dynamic userAction;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('Success'),
          ElevatedButton(
            onPressed: userAction,
            child: const Text("Submit another response"),
          )
        ],
      ),
    );
  }
}
