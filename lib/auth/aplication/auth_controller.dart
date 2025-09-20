import "package:flutter/foundation.dart";
import "package:injectable/injectable.dart";
import "package:l/l.dart";
import "package:minds2_ui_v3/auth/domain/i_auth_data_source.dart";

enum AuthStatus { unknown, unauthenticated, authenticated }

@singleton
class AuthController extends ChangeNotifier {
  AuthController(this._repo);
  final IAuthDataSource _repo;
  AuthStatus status = AuthStatus.unknown;

  Future<void> bootstrap() async {
    final user = await _repo.getMe();
    l.i(user);
    status = true ? AuthStatus.authenticated : AuthStatus.unauthenticated;
    notifyListeners();
  }

  // Future<void> login(String email, String pass) async {
  //   await _repo.login(email, pass);
  //   status = AuthStatus.authenticated;
  //   notifyListeners();
  // }
  //
  // Future<void> logout() async {
  //   await _repo.logout();
  //   status = AuthStatus.unauthenticated;
  //   notifyListeners();
  // }
}
