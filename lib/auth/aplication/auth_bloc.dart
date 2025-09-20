import "package:bloc/bloc.dart";
import "package:freezed_annotation/freezed_annotation.dart";
import "package:injectable/injectable.dart";
import "package:l/l.dart";
import "package:minds2_ui_v3/auth/domain/i_auth_facade.dart";
import "package:minds2_ui_v3/auth/domain/user.dart";
import "package:minds2_ui_v3/core/router/app_router.dart";
import "package:minds2_ui_v3/injectables.dart";
import "package:reactive_forms/reactive_forms.dart";

part "auth_bloc.freezed.dart";

part "auth_event.dart";

part "auth_state.dart";

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(
      IAuthFacade facade, {
        @ignoreParam User? appUser,
        @ignoreParam required String token,
      }) : super(AuthState.initial().copyWith(appUser: appUser, isLoading: false)) {
    on<_StartLogIn>((e, emit) {
      l.d("Fetching Loading FormGroup...");
      emit(state.copyWith(formGroup: facade.formGroupLogin, isLoading: false));
    });
    on<_LogIn>((e, emit) async {
      l.d("Loading User...");
      // Star Loading
      emit(state.copyWith(isLoading: true));
      // Validate the user credential
      final (appUser, token) = await facade.logIn();
      // Update all the credential if anything is ok.
      emit(
        state.copyWith(
          appUser: appUser,
          token: token,
          isLoading: false,
          formGroup: null,
        ),
      );
      getIt<AppRouter>().router.go("/home-project");    // o con helpers

    });
    on<_LogOut>((e, emit) async {
      l.d("LogOut AppUser: $appUser");
      await facade.logOut();
      emit(
        state.copyWith(
          formGroup: null,
          isLoading: true,
          token: "",
          appUser: null,
        ),
      );
      getIt<AppRouter>().router.go("/login");    // o con helpers
    });
  }
}
