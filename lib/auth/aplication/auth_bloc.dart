import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import "package:injectable/injectable.dart";
import "package:minds2_ui_v3/auth/domain/i_auth_facade.dart";
import "package:minds2_ui_v3/auth/domain/user.dart";

part 'auth_bloc.freezed.dart';

part 'auth_event.dart';

part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(IAuthFacade facade) : super(AuthState.initial()) {
    on<_Started>((event, emit) {
      emit(state.copyWith(isLoading: false, appUser: event.appUser));
    });
  }
}
