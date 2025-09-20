import "dart:io";

import "package:dio/dio.dart";
import "package:injectable/injectable.dart";
import "package:l/l.dart";
import "package:minds2_ui_v3/auth/domain/i_auth_data_source.dart";
import "package:minds2_ui_v3/auth/domain/user.dart";
import "package:minds2_ui_v3/core/domain/custom_types.dart";

@Injectable(as: IAuthDataSource)
class AuthDataSourceImpl implements IAuthDataSource {
  const AuthDataSourceImpl(this._dio);

  final Dio _dio;

  @override
  Future<User> getMe() async {
    const path = "/v3/auth/me";
    final response = await _dio.get(path);
    final data = response.data;
    return User.fromJson(data);
  }

  @override
  Future<(User, String)> logIn(Json body) async {
    const path = "/v3/auth/login";
    l.d("Body: $body");
    final response = await _dio.post(path, data: body);
    final token = response.headers.value(HttpHeaders.authorizationHeader);
    final data = response.data;
    return (User.fromJson(data), token!);
  }
}
