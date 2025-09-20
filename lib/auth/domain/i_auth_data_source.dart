import "package:minds2_ui_v3/auth/domain/user.dart";

abstract interface class IAuthDataSource {
  Future<User> getMe();
}
