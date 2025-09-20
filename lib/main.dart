import "package:easy_localization/easy_localization.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:injectable/injectable.dart";
import "package:minds2_ui_v3/app.dart";
import "package:minds2_ui_v3/auth/aplication/auth_bloc.dart";
import "package:minds2_ui_v3/core/infrastructure/app_bloc_observer.dart";
import "package:minds2_ui_v3/core/infrastructure/app_config.dart";
import "package:minds2_ui_v3/injectables.dart";

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies(Environment.prod);

  final messengerKey = GlobalKey<ScaffoldMessengerState>();
  Bloc.observer = AppBlocObserver(messengerKey);
  // instancia ya creada con DI
  final authBloc = getIt<AuthBloc>();

  runApp(
    MultiBlocProvider(
      providers: [BlocProvider<AuthBloc>.value(value: authBloc)],
      child: EasyLocalization(
        supportedLocales: AppConfig.supportedLocales,
        path: AppConfig.translationPath,
        fallbackLocale: AppConfig.fallbackLocale,
        child: App(messengerKey: messengerKey),
      ),
    ),
  );
}
