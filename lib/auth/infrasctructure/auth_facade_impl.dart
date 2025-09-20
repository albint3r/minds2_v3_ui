import "package:injectable/injectable.dart";
import "package:l/l.dart";
import "package:minds2_ui_v3/auth/domain/i_auth_data_source.dart";
import "package:minds2_ui_v3/auth/domain/i_auth_facade.dart";
import "package:minds2_ui_v3/auth/domain/user.dart";
import "package:minds2_ui_v3/core/infrastructure/shared_pref.dart";
import "package:minds2_ui_v3/core/presentation/design_system/atoms/ds_forms.dart";
import "package:reactive_forms/src/models/models.dart";

@Injectable(as: IAuthFacade)
class AuthFacadeImpl implements IAuthFacade {
  AuthFacadeImpl(this._dataSource, this._pref);

  final IAuthDataSource _dataSource;
  final SharedPref _pref;
  FormGroup? _fromGroup = DSForm.empty;

  @override
  FormGroup? get formGroupLogin => _fromGroup = DSForm.logIn;

  @override
  void cleanForm() => _fromGroup = DSForm.empty;

  @override
  Future<User> getMe() async => await _dataSource.getMe();

  @override
  Future<(User, String)> logIn() async {
    final body = _fromGroup?.rawValue ?? {};
    l.d("raw values${_fromGroup?.rawValue}");
    final (appUser, token) = await _dataSource.logIn(body);
    await _pref.setToken(token);
    return (appUser, token);
  }
}
