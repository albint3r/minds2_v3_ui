import "package:easy_localization/easy_localization.dart" as appName;
import "package:flutter/material.dart";
import "package:minds2_ui_v3/core/presentation/design_system/atoms/ds_icon.dart";
import "package:minds2_ui_v3/core/presentation/design_system/atoms/ds_text.dart";
import "package:minds2_ui_v3/core/presentation/design_system/gallery/buttons_gallery.dart";
import "package:minds2_ui_v3/core/presentation/design_system/gallery/colors_gallery.dart";
import "package:minds2_ui_v3/core/presentation/design_system/gallery/icons_gallery.dart";
import "package:minds2_ui_v3/core/presentation/design_system/gallery/metric_card_gallery.dart";
import "package:minds2_ui_v3/core/presentation/design_system/gallery/spacing_gallery.dart";
import "package:minds2_ui_v3/core/presentation/design_system/gallery/textfield_gallery.dart";
import "package:minds2_ui_v3/core/presentation/design_system/gallery/typography_gallery.dart";
import "package:minds2_ui_v3/core/presentation/design_system/tokens/color_tokens.dart";
import "package:minds2_ui_v3/core/presentation/design_system/tokens/icon_tokens.dart";

/// Página simple para visualizar las rampas de color de tu DS.
/// - Usa DSColors.* en todo momento (también para textos).
/// - Muestra cada escala como una fila de “swatches” con el tono y su HEX.
class DesignSystemGalleryPage extends StatelessWidget {
  const DesignSystemGalleryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: DSText.heading1("ds.page.designSystemGalleryPage.title".tr()),
        backgroundColor: cs.surface,
        foregroundColor: cs.onSurface,
        elevation: 0,
      ),
      body: ListView(
        children: [
          ListTile(
            title: DSText.labels(
              "ds.page.designSystemGalleryPage.colorsGallery.title".tr(),
            ),
            subtitle: DSText.paragraph(
              "ds.page.designSystemGalleryPage.colorsGallery.subtitle".tr(),
            ),
            trailing: const DSIcon.md(DSIcons.next),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const ColorsGallery()),
            ),
          ),
          const Divider(height: 1),
          ListTile(
            title: DSText.labels(
              "ds.page.designSystemGalleryPage.typographyGallery.title".tr(),
            ),
            subtitle: DSText.paragraph(
              "ds.page.designSystemGalleryPage.typographyGallery.subtitle".tr(),
            ),
            trailing: const DSIcon.md(DSIcons.next),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const TypographyGallery()),
            ),
          ),
          const Divider(height: 1),
          ListTile(
            title: DSText.labels(
              "ds.page.designSystemGalleryPage.iconsGallery.title".tr(),
            ),
            subtitle: DSText.paragraph(
              "ds.page.designSystemGalleryPage.iconsGallery.subtitle".tr(),
            ),
            trailing: const DSIcon.md(DSIcons.next),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const IconsGallery()),
            ),
          ),
          const Divider(height: 1),
          ListTile(
            title: DSText.labels(
              "ds.page.designSystemGalleryPage.spacyGallery.title".tr(),
            ),
            subtitle: DSText.paragraph(
              "ds.page.designSystemGalleryPage.spacyGallery.subtitle".tr(),
            ),
            trailing: const DSIcon.md(DSIcons.next),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const SpacingGallery()),
            ),
          ),
          const Divider(height: 1),
          ListTile(
            title: DSText.labels(
              "ds.page.designSystemGalleryPage.buttonsGallery.title".tr(),
            ),
            subtitle: DSText.paragraph(
              "ds.page.designSystemGalleryPage.buttonsGallery.subtitle".tr(),
            ),
            trailing: const DSIcon.md(DSIcons.next),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const DSButtonGallery()),
            ),
          ),
          const Divider(height: 1),
          ListTile(
            title: DSText.labels(
              "ds.page.designSystemGalleryPage.inputFieldGallery.title".tr(),
            ),
            subtitle: DSText.paragraph(
              "ds.page.designSystemGalleryPage.inputFieldGallery.subtitle".tr(),
            ),
            trailing: const DSIcon.md(DSIcons.next),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const DSTextFieldGallery()),
            ),
          ),
          const Divider(height: 1),
          ListTile(
            title: DSText.labels(
              "ds.page.designSystemGalleryPage.cardsGallery.title".tr(),
            ),
            subtitle: DSText.paragraph(
              "ds.page.designSystemGalleryPage.cardsGallery.subtitle".tr(),
            ),
            trailing: const DSIcon.md(DSIcons.next),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const DSMetricCardGallery()),
            ),
          ),
        ],
      ),
    );
  }
}

/// Contenedor con título y cuerpo, usa tokens para bordes y superficies.
class _Section extends StatelessWidget {
  const _Section({required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final surface = Theme.of(context).colorScheme.surface;
    final onSurface = Theme.of(context).colorScheme.onSurface;

    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: DSColors.primary.ink[100]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 10, 12, 6),
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: onSurface,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const Divider(height: 1, color: Color(0x1F000000)),
          // Body
          Padding(padding: const EdgeInsets.all(12), child: child),
        ],
      ),
    );
  }
}

/// Fila de “swatches” a partir de un Map<int, Color> (25..900).
class _SwatchRow extends StatelessWidget {
  const _SwatchRow({required this.map});

  final Map<int, Color> map;

  @override
  Widget build(BuildContext context) {
    final entries = map.entries.toList()
      ..sort((a, b) => a.key.compareTo(b.key));

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: entries
            .map((e) => _SwatchBox(tone: e.key, color: e.value))
            .toList(),
      ),
    );
  }
}

/// Caja individual de color con tono y HEX.
/// Usa DSColors.primary.ink[25]/[900] como texto según contraste.
class _SwatchBox extends StatelessWidget {
  const _SwatchBox({required this.tone, required this.color});

  final int tone;
  final Color color;

  @override
  Widget build(BuildContext context) {
    // Decidir color de texto usando los tokens del DS (nunca Colors.white/black)
    final useLightInk = color.computeLuminance() < 0.5;
    final textColor = useLightInk
        ? DSColors.primary.ink[25]!
        : DSColors.primary.ink[900]!;

    return Container(
      width: 96,
      height: 88,
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: DSColors.primary.ink[100]!),
      ),
      padding: const EdgeInsets.all(8),
      child: DefaultTextStyle(
        style: Theme.of(context).textTheme.labelSmall!.copyWith(
          color: textColor,
          fontWeight: FontWeight.w600,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text("$tone"), const Spacer(), Text(_hex(color))],
        ),
      ),
    );
  }

  String _hex(Color c) {
    // #RRGGBB (descarta alpha)
    final r = c.red.toRadixString(16).padLeft(2, "0").toUpperCase();
    final g = c.green.toRadixString(16).padLeft(2, "0").toUpperCase();
    final b = c.blue.toRadixString(16).padLeft(2, "0").toUpperCase();
    return "#$r$g$b";
  }
}

/// Vista previa horizontal del gradiente secundario.
class _GradientPreview extends StatelessWidget {
  const _GradientPreview({required this.colors});

  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: DSColors.primary.ink[100]!),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: colors,
        ),
      ),
    );
  }
}
