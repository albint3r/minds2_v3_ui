import "package:easy_localization/easy_localization.dart";
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
