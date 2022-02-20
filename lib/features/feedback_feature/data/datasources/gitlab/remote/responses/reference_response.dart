import 'package:json_annotation/json_annotation.dart';

part 'reference_response.g.dart';

@JsonSerializable()
class References {
  References({
    this.short,
    this.relative,
    this.full,
  });

  String? short;
  String? relative;
  String? full;

  factory References.fromJson(Map<String, dynamic> json) =>
      _$ReferencesFromJson(json);

  Map<String, dynamic> toJson() => _$ReferencesToJson(this);
}
