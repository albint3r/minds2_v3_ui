import "package:injectable/injectable.dart";
import "package:minds2_ui_v3/auth/domain/i_auth_data_source.dart";
import "package:minds2_ui_v3/auth/domain/i_auth_facade.dart";
import "package:minds2_ui_v3/auth/domain/user.dart";

@Injectable(as: IAuthFacade)
class AuthFacadeImpl implements IAuthFacade {
  const AuthFacadeImpl(this._dataSource);

  final IAuthDataSource _dataSource;

  @override
  Future<User> getMe() async => await _dataSource.getMe();
}
