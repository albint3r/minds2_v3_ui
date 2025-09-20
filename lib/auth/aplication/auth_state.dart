part of "auth_bloc.dart";

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState({required bool isLoading}) = _AuthState;

  factory AuthState.initial() => const AuthState(isLoading: true);
}
