import 'package:json_annotation/json_annotation.dart';

part 'error_schema.g.dart';

@JsonSerializable()
class ErrorSchema {
  ErrorSchema(this.statusCode, this.message);

  int? statusCode;
  String? message;

  factory ErrorSchema.fromJson(Map<String, dynamic> json) =>
      _$ErrorSchemaFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorSchemaToJson(this);

  @override
  String toString() {
    return 'ErrorSchema{statusCode: $statusCode, message: $message}';
  }
}
