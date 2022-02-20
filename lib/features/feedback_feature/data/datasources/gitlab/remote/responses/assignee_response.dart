import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'assignee_response.g.dart';

@JsonSerializable()
class Assignee {
  Assignee(this.state, this.id, this.name, this.webUrl, this.avatarUrl,
      this.username);

  String? state;
  int? id;
  String? name;
  String? webUrl;
  String? avatarUrl;
  String? username;

  factory Assignee.fromJson(Map<String, dynamic> json) =>
      _$AssigneeFromJson(json);

  Map<String, dynamic> toJson() => _$AssigneeToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
