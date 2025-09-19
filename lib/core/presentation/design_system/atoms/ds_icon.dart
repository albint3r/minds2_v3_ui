// lib/core/presentation/design_system/components/ds_icon.dart
import "package:flutter/material.dart";
import "package:minds2_ui_v3/core/presentation/design_system/tokens/icon_tokens.dart";

enum DSIconTone { normal, muted, disabled, selected, warning, error }

enum DSIconSizeName { xs, sm, md, lg, xl, xxl }

class DSIcon extends StatelessWidget {
  const DSIcon(
    this.icon, {
    super.key,
    this.size = DSIconSizeName.md,
    this.tone = DSIconTone.normal,
    this.semanticLabel,
  });

  // ---------- FACTORIES: tonos ----------
  const DSIcon.normal(
    IconData icon, {
    Key? key,
    DSIconSizeName size = DSIconSizeName.md,
    String? semanticLabel,
  }) : this(
         icon,
         key: key,
         size: size,
         tone: DSIconTone.normal,
         semanticLabel: semanticLabel,
       );

  const DSIcon.surface(
    IconData icon, {
    Key? key,
    DSIconSizeName size = DSIconSizeName.md,
    String? semanticLabel,
  }) : this(
         icon,
         key: key,
         size: size,
         tone: DSIconTone.muted,
         semanticLabel: semanticLabel,
       );

  const DSIcon.disabled(
    IconData icon, {
    Key? key,
    DSIconSizeName size = DSIconSizeName.md,
    String? semanticLabel,
  }) : this(
         icon,
         key: key,
         size: size,
         tone: DSIconTone.disabled,
         semanticLabel: semanticLabel,
       );

  const DSIcon.selected(
    IconData icon, {
    Key? key,
    DSIconSizeName size = DSIconSizeName.md,
    String? semanticLabel,
  }) : this(
         icon,
         key: key,
         size: size,
         tone: DSIconTone.selected,
         semanticLabel: semanticLabel,
       );

  const DSIcon.warning(
    IconData icon, {
    Key? key,
    DSIconSizeName size = DSIconSizeName.md,
    String? semanticLabel,
  }) : this(
         icon,
         key: key,
         size: size,
         tone: DSIconTone.warning,
         semanticLabel: semanticLabel,
       );

  const DSIcon.error(
    IconData icon, {
    Key? key,
    DSIconSizeName size = DSIconSizeName.md,
    String? semanticLabel,
  }) : this(
         icon,
         key: key,
         size: size,
         tone: DSIconTone.error,
         semanticLabel: semanticLabel,
       );

  // ---------- FACTORIES: tamaños ----------
  const DSIcon.xs(
    IconData icon, {
    Key? key,
    DSIconTone tone = DSIconTone.normal,
    String? semanticLabel,
  }) : this(
         icon,
         key: key,
         size: DSIconSizeName.xs,
         tone: tone,
         semanticLabel: semanticLabel,
       );

  const DSIcon.sm(
    IconData icon, {
    Key? key,
    DSIconTone tone = DSIconTone.normal,
    String? semanticLabel,
  }) : this(
         icon,
         key: key,
         size: DSIconSizeName.sm,
         tone: tone,
         semanticLabel: semanticLabel,
       );

  const DSIcon.md(
    IconData icon, {
    Key? key,
    DSIconTone tone = DSIconTone.normal,
    String? semanticLabel,
  }) : this(
         icon,
         key: key,
         size: DSIconSizeName.md,
         tone: tone,
         semanticLabel: semanticLabel,
       );

  const DSIcon.lg(
    IconData icon, {
    Key? key,
    DSIconTone tone = DSIconTone.normal,
    String? semanticLabel,
  }) : this(
         icon,
         key: key,
         size: DSIconSizeName.lg,
         tone: tone,
         semanticLabel: semanticLabel,
       );

  const DSIcon.xl(
    IconData icon, {
    Key? key,
    DSIconTone tone = DSIconTone.normal,
    String? semanticLabel,
  }) : this(
         icon,
         key: key,
         size: DSIconSizeName.xl,
         tone: tone,
         semanticLabel: semanticLabel,
       );

  const DSIcon.xxl(
      IconData icon, {
        Key? key,
        DSIconTone tone = DSIconTone.normal,
        String? semanticLabel,
      }) : this(
    icon,
    key: key,
    size: DSIconSizeName.xxl,
    tone: tone,
    semanticLabel: semanticLabel,
  );

  // ---------- Campos ----------
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
    DSIconSizeName.xxl => DSIconSize.xxl,
  };

  Color _color(DSIconTone t, ColorScheme cs) => switch (t) {
    DSIconTone.normal => DSIconColors.normal(cs),
    DSIconTone.muted => DSIconColors.surface(cs),
    DSIconTone.disabled => DSIconColors.disabled(cs),
    DSIconTone.selected => DSIconColors.selected(cs),
    DSIconTone.warning => DSIconColors.warning(cs),
    DSIconTone.error => DSIconColors.error(cs),
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
