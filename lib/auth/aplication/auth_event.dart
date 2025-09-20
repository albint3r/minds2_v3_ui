part of "auth_bloc.dart";

@freezed
abstract class AuthEvent with _$AuthEvent {
  const factory AuthEvent.started({User? appUser}) = _Started;
}
