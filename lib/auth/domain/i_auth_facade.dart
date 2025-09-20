import "package:minds2_ui_v3/auth/domain/user.dart";
import "package:reactive_forms/reactive_forms.dart";

abstract interface class IAuthFacade {
  FormGroup? get formGroup;

  Future<User> getMe();
}
