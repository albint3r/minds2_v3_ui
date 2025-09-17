// lib/core/presentation/design_system/components/ds_icon.dart
import "package:flutter/material.dart";
import "package:minds2_ui_v3/core/presentation/design_system/tokens/icon_tokens.dart";

enum DSIconTone { normal, muted, disabled, selected, warning, error }
enum DSIconSizeName { xs, sm, md, lg, xl }

class DSIcon extends StatelessWidget {
  const DSIcon(
      this.icon, {
        super.key,
        this.size = DSIconSizeName.md,
        this.tone = DSIconTone.normal,
        this.semanticLabel,
      });

  final IconData icon;
  final DSIconSizeName size;
  final DSIconTone tone;
  final String? semanticLabel;

  double _px(DSIconSizeName s) => switch (s) {
    DSIconSizeName.xs => DSIconSize.xs,
    DSIconSizeName.sm => DSIconSize.sm,
    DSIconSizeName.md => DSIconSize.md,
    DSIconSizeName.lg => DSIconSize.lg,
    DSIconSizeName.xl => DSIconSize.xl,
  };

  Color _color(DSIconTone t, ColorScheme cs) => switch (t) {
    DSIconTone.normal   => DSIconColors.normal(cs),
    DSIconTone.muted    => DSIconColors.muted(cs),
    DSIconTone.disabled => DSIconColors.disabled(cs),
    DSIconTone.selected => DSIconColors.selected(cs),
    DSIconTone.warning  => DSIconColors.warning(cs),
    DSIconTone.error    => DSIconColors.error(cs),
  };

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Icon(
      icon,
      size: _px(size),
      color: _color(tone, cs),
      semanticLabel: semanticLabel,
    );
  }
}
