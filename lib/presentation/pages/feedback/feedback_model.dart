class FeedbackModel {
  FeedbackModel(
      {required this.title,
      this.description,
      this.actualBehaviour,
      this.expectedBehaviour});

  String title;
  String? description;
  String? actualBehaviour;
  String? expectedBehaviour;
}
