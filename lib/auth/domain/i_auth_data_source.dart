import "package:minds2_ui_v3/auth/domain/user.dart";
import "package:minds2_ui_v3/core/domain/custom_types.dart";

abstract interface class IAuthDataSource {
  Future<User> getMe();

  Future<(User, String)> logIn(Json body);

}
