import "package:flutter/material.dart";
import "package:minds2_ui_v3/core/presentation/design_system/components/ds_icon.dart";
import "package:minds2_ui_v3/core/presentation/design_system/components/ds_text.dart";
import "package:minds2_ui_v3/core/presentation/design_system/gallery/buttons_gallery.dart";
import "package:minds2_ui_v3/core/presentation/design_system/gallery/colors_gallery.dart";
import "package:minds2_ui_v3/core/presentation/design_system/gallery/icons_gallery.dart"; // ⬅️ nuevo
import "package:minds2_ui_v3/core/presentation/design_system/gallery/spacing_gallery.dart";
import "package:minds2_ui_v3/core/presentation/design_system/gallery/typography_gallery.dart";
import "package:minds2_ui_v3/core/presentation/design_system/theme/theme_config.dart";
import "package:minds2_ui_v3/core/presentation/design_system/tokens/icon_tokens.dart";

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
        title: DSText.heading1("Design System · Gallery"),
        backgroundColor: cs.surface,
        foregroundColor: cs.onSurface,
        elevation: 0,
      ),
      body: ListView(
        children: [
          ListTile(
            title: DSText.labels("Colors Gallery"),
            subtitle: DSText.paragraph(
              "Ramps · Brand · Ink · Secondary · Alerts",
            ),
            trailing: const DSIcon.md(DSIcons.next),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const ColorsGallery()),
            ),
          ),
          const Divider(height: 1),
          ListTile(
            title: DSText.labels("Typography Gallery"),
            subtitle: DSText.paragraph(
              "Nunito · Headings · Titles · Body · Labels",
            ),
            trailing: const DSIcon.md(DSIcons.next),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const TypographyGallery()),
            ),
          ),
          const Divider(height: 1),
          ListTile(
            title: DSText.labels("Icons Gallery"),
            subtitle: DSText.paragraph("Íconos maestros del DS"),
            trailing: const DSIcon.md(DSIcons.next),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const IconsGallery()),
            ),
          ),
          const Divider(height: 1),
          ListTile(
            title: DSText.labels("Spacing Gallery"),
            subtitle: DSText.paragraph("XS · SM · MD · LG · XL · XXL"),
            trailing: const DSIcon.md(DSIcons.next),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const SpacingGallery()),
            ),
          ),
          ListTile(
            title: DSText.labels("Buttons Gallery"),
            subtitle: DSText.paragraph("XS · SM · MD · LG · XL · XXL"),
            trailing: const DSIcon.md(DSIcons.next),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const DSButtonGallery()),
            ),
          )
        ],
      ),
    );
  }
}
