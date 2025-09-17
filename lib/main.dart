import "package:flutter/material.dart";
import "package:minds2_ui_v3/core/presentation/design_system/gallery/colors_gallery.dart";
import "package:minds2_ui_v3/core/presentation/design_system/gallery/icons_gallery.dart"; // ⬅️ nuevo
import "package:minds2_ui_v3/core/presentation/design_system/gallery/typography_gallery.dart";
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
      home: const _GalleryMenu(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class _GalleryMenu extends StatelessWidget {
  const _GalleryMenu();

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Design System · Gallery"),
        backgroundColor: cs.surface,
        foregroundColor: cs.onSurface,
        elevation: 0,
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text("Colors Gallery"),
            subtitle: const Text("Ramps · Brand · Ink · Secondary · Alerts"),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const ColorsGallery()),
            ),
          ),
          const Divider(height: 1),
          ListTile(
            title: const Text("Typography Gallery"),
            subtitle: const Text("Nunito · Headings · Titles · Body · Labels"),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const TypographyGallery()),
            ),
          ),
          const Divider(height: 1),
          ListTile(
            title: const Text("Icons Gallery"),
            subtitle: const Text("Íconos maestros del DS"),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const IconsGallery()),
            ),
          ),
        ],
      ),
    );
  }
}
