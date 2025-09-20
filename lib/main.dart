import "package:easy_localization/easy_localization.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:injectable/injectable.dart";
import "package:minds2_ui_v3/app_ds.dart";
import "package:minds2_ui_v3/auth/aplication/auth_controller.dart";
import "package:minds2_ui_v3/core/infrastructure/app_bloc_observer.dart";
import "package:minds2_ui_v3/injectables.dart";

Future<void> main() async {
  await configureDependencies(Environment.prod);
  final messengerKey = GlobalKey<ScaffoldMessengerState>();
  Bloc.observer = AppBlocObserver(messengerKey);
  final authController = getIt<AuthController>();
  await authController.bootstrap();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale("en", "US"), Locale("es", "MX")],
      path: "assets/translations",
      fallbackLocale: const Locale("en", "US"),
      // Si usas en.json / es.json, activa:
      // useOnlyLangCode: true,
      child: DSApp(messengerKey: messengerKey),
    ),
  );
}
