import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_template/domain/feedback/entities/label.dart';
import 'package:flutter_clean_architecture_template/presentation/pages/feedback_controller.dart';
import 'package:flutter_clean_architecture_template/presentation/translation/app_translation.dart';
import 'package:flutter_clean_architecture_template/presentation/widgets/loading_widget.dart';
import 'package:flutter_clean_architecture_template/presentation/widgets/response_error_widget.dart';
import 'package:flutter_clean_architecture_template/presentation/widgets/success_widget.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../domain/core/entities/status.dart';

class FeedbackWidget extends StatelessWidget {
  final FeedbackController controller = Get.put(FeedbackController());

  FeedbackWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      switch (controller.status.value) {
        case Status.initial:
          return _buildFeedbackForm(context);
        case Status.loading:
          return const LoadingWidget();
        case Status.success:
          return SuccessWidget();
        case Status.error:
          return ResponseErrorWidget(
              userAction: _onErrorHandling,
              errorMessage: AppTranslation.errorFeedback.tr);
      }
    });
  }

  void _onErrorHandling(String errorMessage) {
    controller.backOnError();
  }

  Widget _buildFeedbackForm(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 500,
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 16, 32, 8),
                child: TextFormField(
                  autovalidateMode: controller.showError.value
                      ? AutovalidateMode.always
                      : AutovalidateMode.disabled,
                  onChanged: (e) => {controller.issue.value.title = e},
                  validator: (e) {
                    if (controller.showError.value) {
                      return 'title cannot be empty';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      labelText: AppTranslation.title.tr,
                      border: const OutlineInputBorder()),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 8, 32, 16),
                child: TextFormField(
                  onChanged: (e) => {controller.issue.value.body = e},
                  decoration: InputDecoration(
                    labelText: AppTranslation.description.tr,
                    border: const OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 8, 32, 16),
                child: Row(
                  children: [
                    Text(
                      AppTranslation.feedbackCategory.tr,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: 240,
                      child: DropdownSearch<String>(
                          mode: Mode.MENU,
                          items: [
                            Label.bug.name,
                            Label.featureRequest.name,
                            Label.improvement.name
                          ],
                          dropdownBuilder: (context, value) => Row(
                                children: [
                                  const Spacer(),
                                  if (value == Label.bug.name)
                                    const FaIcon(FontAwesomeIcons.bug),
                                  if (value == Label.featureRequest.name)
                                    const FaIcon(FontAwesomeIcons.magic),
                                  if (value == Label.improvement.name)
                                    const FaIcon(FontAwesomeIcons.tools),
                                  const Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Text(
                                      value ?? "null",
                                      style: const TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                ],
                              ),
                          onChanged: print,
                          selectedItem: Label.bug.name),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () => controller.submit(),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(446, 64),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          topRight: Radius.circular(5),
                          bottomLeft: Radius.circular(5),
                          bottomRight: Radius.circular(5))),
                ),
                child: Text(AppTranslation.submit.tr),
              )
            ],
          ),
        ),
      ),
    );
  }
}
