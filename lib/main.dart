import "package:easy_localization/easy_localization.dart";
import "package:flutter/material.dart";
import "package:minds2_ui_v3/core/presentation/design_system/design_system_gallery_page.dart";
import "package:minds2_ui_v3/core/presentation/design_system/theme/theme_config.dart";

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale("en", "US"), Locale("es", "MX")],
      path: "assets/translations",
      fallbackLocale: const Locale("es", "MX"),
      // Si usas en.json / es.json, activa:
      // useOnlyLangCode: true,
      child: const DSApp(),
    ),
  );
}

class DSApp extends StatelessWidget {
  const DSApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = ThemeConfig();

    return MaterialApp(
      title: "Minds2 DS",
      theme: theme.light,
      debugShowCheckedModeBanner: false,
      // 👇 necesario para que cargue las traducciones
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: const DesignSystemGalleryPage(),
    );
  }
}

