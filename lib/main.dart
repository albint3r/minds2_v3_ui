import "package:flutter/material.dart";
import "package:minds2_ui_v3/core/presentation/design_system/design_system_gallery_page.dart";
import "package:minds2_ui_v3/core/presentation/design_system/theme/theme_config.dart";

void main() {
  runApp(const DSApp());
}

class DSApp extends StatelessWidget {
  const DSApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = ThemeConfig();

    return MaterialApp(
      title: "Minds2 DS",
      theme: theme.light,
      home: const DesignSystemGalleryPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
