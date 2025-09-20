part of "auth_bloc.dart";

@freezed
abstract class AuthEvent with _$AuthEvent {
  const factory AuthEvent.startLogIn() = _StartLogIn;

  const factory AuthEvent.logIn() = _LogIn;

  const factory AuthEvent.logOut() = _LogOut;
}
