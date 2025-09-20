import "package:freezed_annotation/freezed_annotation.dart";

enum AppAccessType {
  @JsonValue('super_admin')
  superAdmin,

  @JsonValue('admin')
  admin,

  @JsonValue('client')
  client,
}