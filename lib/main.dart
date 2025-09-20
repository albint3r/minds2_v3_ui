import "package:easy_localization/easy_localization.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:injectable/injectable.dart";
import "package:minds2_ui_v3/app.dart";
import "package:minds2_ui_v3/auth/aplication/auth_bloc.dart";
import "package:minds2_ui_v3/core/infrastructure/app_bloc_observer.dart";
import "package:minds2_ui_v3/injectables.dart";

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies(Environment.prod);

  final messengerKey = GlobalKey<ScaffoldMessengerState>();
  Bloc.observer = AppBlocObserver(messengerKey);
  // 2) Resuelve el singleton del bloc (inyectado con IAuthFacade por DI)
  final authBloc = getIt<AuthBloc>();

  // 3) Siembra el estado (evento)
  authBloc.add(AuthEvent.started());

  // (Opcional) Espera a que quede listo antes del primer frame
  // await authBloc.stream.firstWhere((s) => s.appUser != null && !s.isLoading);

  runApp(
    BlocProvider.value(
      value: authBloc, // ¡ojo! value porque es singleton (no se cierra)
      child: EasyLocalization(
        supportedLocales: const [Locale('en', 'US'), Locale('es', 'MX')],
        path: 'assets/translations',
        fallbackLocale: const Locale('en', 'US'),
        child: App(messengerKey: messengerKey),
      ),
    ),
  );
}
