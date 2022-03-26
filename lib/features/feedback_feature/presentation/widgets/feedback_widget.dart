import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../translation/app_translation.dart';
import '../../../../core/entities/status.dart';
import '../../data/datasources/gitlab/gitlab_constants.dart';
import '../../domain/entities/label.dart';
import 'loading_widget.dart';
import 'response_error_widget.dart';
import 'success_widget.dart';
import '../controller/feedback_controller.dart';

class FeedbackWidget extends StatelessWidget {
  FeedbackWidget({Key? key, required this.accessToken}) : super(key: key);
  final FeedbackController controller = Get.put(FeedbackController());
  final String accessToken;

  @override
  Widget build(BuildContext context) {
    gitlabToken = accessToken;
    return Obx(() {
      switch (controller.status.value) {
        case Status.initial:
          return _buildFeedbackForm(context);
        case Status.loading:
          return const LoadingWidget();
        case Status.success:
          return SuccessWidget(userAction: _onSuccessClick);
        case Status.error:
          return ResponseErrorWidget(
              userAction: _onErrorHandling,
              errorMessage: controller.errorMessage.isEmpty
                  ? AppTranslation.errorFeedback.tr
                  : controller.errorMessage);
      }
    });
  }

  void _onSuccessClick() {
    controller.status.value = Status.initial;
  }

  void _onErrorHandling(String errorMessage) {
    controller.backOnError();
  }

  Widget _buildFeedbackForm(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        margin: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: Colors.grey, spreadRadius: 2.0, blurRadius: 20)
            ],
            borderRadius: BorderRadius.all(Radius.circular(8))),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(32, 16, 32, 8),
                  child: Obx(() => TextFormField(
                    initialValue: controller.issue.value.title,
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
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(32, 8, 32, 16),
                  child: TextFormField(
                    minLines: 4,
                    maxLines: 4,
                    onChanged: (e) => {controller.issue.value.description = e},
                    decoration: InputDecoration(
                      alignLabelWithHint: true,
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
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: DropdownSearch<String>(
                            mode: Mode.MENU,
                            items: [
                              Label.bug.name,
                              Label.feature.name,
                              Label.improvement.name,
                              Label.documentation.name
                            ],
                            dropdownBuilder: (context, value) => Row(
                              children: [
                                const Spacer(),
                                if (value == Label.bug.name)
                                  const FaIcon(FontAwesomeIcons.bug),
                                if (value == Label.feature.name)
                                  const FaIcon(FontAwesomeIcons.magic),
                                if (value == Label.improvement.name)
                                  const FaIcon(FontAwesomeIcons.tools),
                                if (value == Label.documentation.name)
                                  const FaIcon(FontAwesomeIcons.book),
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
                            onChanged: (value) {
                              controller.label.value = value!;
                            },
                            selectedItem: controller.label.value),
                      ),
                    ],
                  ),
                ),
                if (controller.label.value == Label.bug.name)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32, 8, 32, 16),
                    child: TextFormField(
                      minLines: 4,
                      maxLines: 8,
                      onChanged: (e) =>
                      {controller.issue.value.actualBehaviour = e},
                      decoration: InputDecoration(
                        alignLabelWithHint: true,
                        labelText: AppTranslation.actualBehaviour.tr,
                        border: const OutlineInputBorder(),
                      ),
                    ),
                  ),
                if (controller.label.value == Label.bug.name)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32, 8, 32, 16),
                    child: TextFormField(
                      minLines: 4,
                      maxLines: 8,
                      onChanged: (e) =>
                      {controller.issue.value.expectedBehaviour = e},
                      decoration: InputDecoration(
                        alignLabelWithHint: true,
                        labelText: AppTranslation.expectedBehaviour.tr,
                        border: const OutlineInputBorder(),
                      ),
                    ),
                  ),
                Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  child: ElevatedButton(
                    onPressed: () => controller.submit(),
                    style: ElevatedButton.styleFrom(
                      fixedSize:
                      Size((MediaQuery.of(context).size.width * 0.8) - 64, 64),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5),
                              topRight: Radius.circular(5),
                              bottomLeft: Radius.circular(5),
                              bottomRight: Radius.circular(5))),
                    ),
                    child: Text(AppTranslation.submit.tr),
                  )
                )
              ],
            ),
          ),
        )
      ),
    );
  }
}
