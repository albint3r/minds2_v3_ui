import "package:dio/dio.dart";
import "package:injectable/injectable.dart";
import "package:minds2_ui_v3/auth/domain/i_auth_data_source.dart";
import "package:minds2_ui_v3/auth/domain/user.dart";

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
}
