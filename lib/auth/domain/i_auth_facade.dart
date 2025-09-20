import "package:minds2_ui_v3/auth/domain/user.dart";
import "package:reactive_forms/reactive_forms.dart";

abstract interface class IAuthFacade {
  FormGroup? get formGroupLogin;

  Future<User> getMe();

  void cleanForm();

  Future<(User, String)> logIn();
}
