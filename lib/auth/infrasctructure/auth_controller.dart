import "package:flutter/foundation.dart";
import "package:injectable/injectable.dart";
import "package:l/l.dart";
import "package:minds2_ui_v3/auth/domain/i_auth_facade.dart";
import "package:minds2_ui_v3/auth/domain/user.dart";

enum AuthStatus { unknown, unauthenticated, authenticated }

@singleton
class AuthController extends ChangeNotifier {
  AuthController(this._authFacade);

  final IAuthFacade _authFacade;
  AuthStatus status = AuthStatus.unknown;

  Future<User?> bootstrap() async {
    User? user;
    try {
      user = await _authFacade.getMe();
    } catch (e) {
      user = null;
    }
    l.i("-----> User return $user");
    status = user is User
        ? AuthStatus.authenticated
        : AuthStatus.unauthenticated;
    notifyListeners();
    return user;
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
