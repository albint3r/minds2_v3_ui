import "package:easy_localization/easy_localization.dart";
import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "package:minds2_ui_v3/core/presentation/design_system/theme/theme_config.dart";

class MaterialAppRouterDelegate {
  static MaterialApp router(
    String title, {
    required GoRouter router,
    required ThemeConfig themeConfig,
    required GlobalKey<ScaffoldMessengerState> messengerKey,
    required BuildContext context,
  }) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: messengerKey,
      theme: themeConfig.light,
      // darkTheme: themeConfig.dark,
      themeMode: ThemeMode.light,
      title: title,
      routerConfig: router,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}
