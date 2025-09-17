// lib/core/presentation/design_system/gallery/spacing_gallery.dart
import "package:flutter/material.dart";
import "package:minds2_ui_v3/core/presentation/design_system/components/ds_gap.dart";
import "package:minds2_ui_v3/core/presentation/design_system/components/ds_text.dart";
import "package:minds2_ui_v3/core/presentation/design_system/tokens/spacing_tokens.dart";

class SpacingGallery extends StatelessWidget {
  const SpacingGallery({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    final items = const <_SpaceSpec>[
      _SpaceSpec("XS", DSSpacing.xs),
      _SpaceSpec("SM", DSSpacing.sm),
      _SpaceSpec("MD", DSSpacing.md),
      _SpaceSpec("LG", DSSpacing.lg),
      _SpaceSpec("XL", DSSpacing.xl),
      _SpaceSpec("XXL", DSSpacing.xxl),
    ];

    return Scaffold(
      appBar: AppBar(
        title: DSText.heading4("Design System · Spacing"),
        backgroundColor: cs.surface,
        foregroundColor: cs.onSurface,
        elevation: 0,
      ),
      backgroundColor: cs.surface,
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            decoration: BoxDecoration(
              color: cs.surface,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: cs.outlineVariant),
            ),
            child: Column(
              children: [
                // Header (usa DSText.labels para que coincida con el DS)
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 10,
                  ),
                  child: Row(
                    children: [
                      Expanded(flex: 2, child: DSText.labels("Name")),
                      const DSGap.sm(),
                      Expanded(flex: 1, child: DSText.labels("PX")),
                      const DSGap.sm(),
                      Expanded(flex: 4, child: DSText.labels("Preview")),
                    ],
                  ),
                ),
                Divider(height: 1, color: cs.outlineVariant),
                ...items.map((s) => _SpacingRow(spec: s)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SpaceSpec {
  const _SpaceSpec(this.name, this.px);

  final String name;
  final double px;
}

class _SpacingRow extends StatelessWidget {
  const _SpacingRow({required this.spec});

  final _SpaceSpec spec;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Name
          Expanded(flex: 2, child: DSText.labels(spec.name)),
          const DSGap.sm(),

          // PX
          Expanded(flex: 1, child: DSText.labels("${_px(spec.px)}")),
          const DSGap.sm(),

          // Preview bar (usa alto = px y un contenedor ancho)
          Expanded(
            flex: 4,
            child: Row(
              children: [
                // Barra visible con la altura exacta del token
                Container(
                  width: 160,
                  height: spec.px,
                  decoration: BoxDecoration(
                    color: cs.primary,
                    borderRadius: BorderRadius.circular(999),
                  ),
                ),
                const DSGap.sm(),
                // Etiqueta de ayuda
                DSText.paragraph("height = ${_px(spec.px)}"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _px(double v) =>
      v.toStringAsFixed(v % 1 == 0 ? 0 : 0); // muestra entero
}
