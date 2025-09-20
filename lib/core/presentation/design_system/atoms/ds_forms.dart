import "package:minds2_ui_v3/core/presentation/design_system/atoms/ds_fields.dart";
import "package:reactive_forms/reactive_forms.dart";

class DSForm {
  static FormGroup get empty => FormGroup({});

  static FormGroup get logIn =>
      FormGroup({"email": DSFields.email, "password": DSFields.password});

  static FormGroup get signUp => FormGroup(
    {
      "name": DSFields.userName,
      "last_name": DSFields.userLastName,
      "email": DSFields.email,
      "phone": DSFields.phone,
      "password": DSFields.password,
      "confirm_password": DSFields.confirmPassword,
    },
    validators: [Validators.mustMatch("password", "confirm password")],
  );

  static FormGroup get recoverPassword => FormGroup({"email": DSFields.email});

  static FormGroup get createNewPassword => FormGroup({
    "password": DSFields.email,
    "confirm_password": DSFields.confirmPassword,
  });
}
