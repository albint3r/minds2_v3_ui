import "package:freezed_annotation/freezed_annotation.dart";
import "package:minds2_ui_v3/auth/domain/enum_app_acces_type.dart";

part "user.freezed.dart";

part "user.g.dart";

@freezed
@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class User with _$User {
  const User({
    required this.createDate,
    required this.userId,
    required this.email,
    required this.name,
    required this.lastName,
    this.profileImageUrl,
    this.countryCode = 52,
    this.phone,
    this.active = false,
    this.appAccess = AppAccessType.admin,
    this.stripeCustomerId,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  @override
  final DateTime createDate;
  @override
  final String userId;
  @override
  final String email;

  @override
  final String name;
  @override
  final String lastName;
  @override
  final String? profileImageUrl;
  @override
  final int countryCode;
  @override
  final String? phone;
  @override
  final bool active;
  @override
  final AppAccessType appAccess;
  @override
  final String? stripeCustomerId;
}
