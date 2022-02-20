import 'package:json_annotation/json_annotation.dart';

part 'links_response.g.dart';

@JsonSerializable()
class Links {
  Links({this.self, this.notes, this.awardEmoji, this.project});

  String? self;
  String? notes;
  String? awardEmoji;
  String? project;

  factory Links.fromJson(Map<String, dynamic> json) => _$LinksFromJson(json);

  Map<String, dynamic> toJson() => _$LinksToJson(this);
}
