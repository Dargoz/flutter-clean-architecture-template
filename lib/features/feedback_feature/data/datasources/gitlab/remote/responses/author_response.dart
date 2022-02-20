import 'package:json_annotation/json_annotation.dart';

part 'author_response.g.dart';

@JsonSerializable()
class Author {
  Author(this.id, this.username, this.name, this.state, this.avatarUrl,
      this.webUrl);

  int? id;
  String? username;
  String? name;
  String? state;
  String? avatarUrl;
  String? webUrl;

  factory Author.fromJson(Map<String, dynamic> json) => _$AuthorFromJson(json);

  Map<String, dynamic> toJson() => _$AuthorToJson(this);
}
