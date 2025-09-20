// lib/core/presentation/design_system/ds_app.dart
import "package:flutter/material.dart";
import "package:minds2_ui_v3/core/presentation/design_system/theme/theme_config.dart";
import "package:minds2_ui_v3/core/router/app_router.dart";
import "package:minds2_ui_v3/core/router/material_app_router_delegate.dart";
import "package:minds2_ui_v3/injectables.dart";

class App extends StatelessWidget {
  const App({super.key, required this.messengerKey});

  final GlobalKey<ScaffoldMessengerState> messengerKey;

  @override
  Widget build(BuildContext context) {
    final theme = getIt<ThemeConfig>();
    final router = getIt<AppRouter>().router;

    return MaterialAppRouterDelegate.router(
      "Minds2",
      router: router,
      themeConfig: theme,
      messengerKey: messengerKey,
      context: context,
    );
  }
}
