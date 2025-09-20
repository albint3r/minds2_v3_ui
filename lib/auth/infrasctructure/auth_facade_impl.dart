import "package:injectable/injectable.dart";
import "package:minds2_ui_v3/auth/domain/i_auth_data_source.dart";
import "package:minds2_ui_v3/auth/domain/i_auth_facade.dart";
import "package:minds2_ui_v3/auth/domain/user.dart";
import "package:minds2_ui_v3/core/presentation/design_system/organisms/ds_forms.dart";
import "package:reactive_forms/src/models/models.dart";

@Injectable(as: IAuthFacade)
class AuthFacadeImpl implements IAuthFacade {
  const AuthFacadeImpl(this._dataSource);

  final IAuthDataSource _dataSource;

  @override
  FormGroup? get formGroup => DSForm.logIn;

  @override
  Future<User> getMe() async => await _dataSource.getMe();
}
