// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
  createDate: DateTime.parse(json['create_date'] as String),
  userId: json['user_id'] as String,
  email: json['email'] as String,
  name: json['name'] as String,
  lastName: json['last_name'] as String,
  profileImageUrl: json['profile_image_url'] as String?,
  countryCode: (json['country_code'] as num?)?.toInt() ?? 52,
  phone: json['phone'] as String?,
  active: json['active'] as bool? ?? false,
  appAccess:
      $enumDecodeNullable(_$AppAccessTypeEnumMap, json['app_access']) ??
      AppAccessType.admin,
  stripeCustomerId: json['stripe_customer_id'] as String?,
);

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  'create_date': instance.createDate.toIso8601String(),
  'user_id': instance.userId,
  'email': instance.email,
  'name': instance.name,
  'last_name': instance.lastName,
  'profile_image_url': instance.profileImageUrl,
  'country_code': instance.countryCode,
  'phone': instance.phone,
  'active': instance.active,
  'app_access': _$AppAccessTypeEnumMap[instance.appAccess]!,
  'stripe_customer_id': instance.stripeCustomerId,
};

const _$AppAccessTypeEnumMap = {
  AppAccessType.superAdmin: 'super_admin',
  AppAccessType.admin: 'admin',
  AppAccessType.client: 'client',
};
