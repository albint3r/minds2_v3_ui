import "package:easy_localization/easy_localization.dart";
import "package:flutter/material.dart";
import "package:minds2_ui_v3/core/presentation/design_system/design_system_gallery_page.dart";
import "package:minds2_ui_v3/core/presentation/design_system/theme/theme_config.dart" show ThemeConfig;
import "package:minds2_ui_v3/injectables.dart";

class DSApp extends StatelessWidget {
  const DSApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = getIt<ThemeConfig>();

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