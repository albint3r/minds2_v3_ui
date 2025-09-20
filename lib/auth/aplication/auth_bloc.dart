import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import "package:injectable/injectable.dart";
import "package:minds2_ui_v3/auth/domain/i_auth_facade.dart";
import "package:minds2_ui_v3/auth/domain/user.dart";

part 'auth_bloc.freezed.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(
    IAuthFacade facade, {
    @ignoreParam User? appUser,
    @ignoreParam required String token,
  }) : super(AuthState.initial().copyWith(appUser: appUser, isLoading: false)) {
    on<_Started>((e, emit) {
      print('*-' * 100);
      print("App-User: ${state}");
      print('*-' * 100);
      // emit(state.copyWith(isLoading: false, appUser: e.appUser));
    });
  }
}
