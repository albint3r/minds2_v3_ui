// lib/core/presentation/design_system/atoms/ds_icon.dart
import "package:flutter/material.dart";
import "package:minds2_ui_v3/core/presentation/design_system/tokens/icon_tokens.dart";

/// Tono → define el color del ícono
enum DSIconType { normal, surface, disabled, selected, warning, error }

/// Tamaño → define el tamaño del ícono
enum DSIconSizeName { xs, sm, md, lg, xl, xxl }

class DSIcon extends StatelessWidget {
  // ───────────────────────── FACTORIES POR ÍCONO ─────────────────────────

  // Home / navegación
  const DSIcon.home({
    Key? key,
    DSIconType type = DSIconType.normal,
    DSIconSizeName size = DSIconSizeName.md,
    String? semanticLabel,
  }) : this._(
         DSIcons.home,
         key: key,
         type: type,
         size: size,
         semanticLabel: semanticLabel,
       );

  const DSIcon.conversation({
    Key? key,
    DSIconType type = DSIconType.normal,
    DSIconSizeName size = DSIconSizeName.md,
    String? semanticLabel,
  }) : this._(
         DSIcons.conversation,
         key: key,
         type: type,
         size: size,
         semanticLabel: semanticLabel,
       );

  // Usuario
  const DSIcon.contact({
    Key? key,
    DSIconType type = DSIconType.normal,
    DSIconSizeName size = DSIconSizeName.md,
    String? semanticLabel,
  }) : this._(
         DSIcons.contact,
         key: key,
         type: type,
         size: size,
         semanticLabel: semanticLabel,
       );

  const DSIcon.funnel({
    Key? key,
    DSIconType type = DSIconType.normal,
    DSIconSizeName size = DSIconSizeName.md,
    String? semanticLabel,
  }) : this._(
         DSIcons.funnel,
         key: key,
         type: type,
         size: size,
         semanticLabel: semanticLabel,
       );

  const DSIcon.calendar({
    Key? key,
    DSIconType type = DSIconType.normal,
    DSIconSizeName size = DSIconSizeName.md,
    String? semanticLabel,
  }) : this._(
         DSIcons.calendar,
         key: key,
         type: type,
         size: size,
         semanticLabel: semanticLabel,
       );

  const DSIcon.campaign({
    Key? key,
    DSIconType type = DSIconType.normal,
    DSIconSizeName size = DSIconSizeName.md,
    String? semanticLabel,
  }) : this._(
         DSIcons.campaign,
         key: key,
         type: type,
         size: size,
         semanticLabel: semanticLabel,
       );

  const DSIcon.aiBuilder({
    Key? key,
    DSIconType type = DSIconType.normal,
    DSIconSizeName size = DSIconSizeName.md,
    String? semanticLabel,
  }) : this._(
         DSIcons.aiBuilder,
         key: key,
         type: type,
         size: size,
         semanticLabel: semanticLabel,
       );

  const DSIcon.integrations({
    Key? key,
    DSIconType type = DSIconType.normal,
    DSIconSizeName size = DSIconSizeName.md,
    String? semanticLabel,
  }) : this._(
         DSIcons.integrations,
         key: key,
         type: type,
         size: size,
         semanticLabel: semanticLabel,
       );

  const DSIcon.team({
    Key? key,
    DSIconType type = DSIconType.normal,
    DSIconSizeName size = DSIconSizeName.md,
    String? semanticLabel,
  }) : this._(
         DSIcons.team,
         key: key,
         type: type,
         size: size,
         semanticLabel: semanticLabel,
       );

  const DSIcon.billing({
    Key? key,
    DSIconType type = DSIconType.normal,
    DSIconSizeName size = DSIconSizeName.md,
    String? semanticLabel,
  }) : this._(
         DSIcons.billing,
         key: key,
         type: type,
         size: size,
         semanticLabel: semanticLabel,
       );

  const DSIcon.integrationsApply({
    Key? key,
    DSIconType type = DSIconType.normal,
    DSIconSizeName size = DSIconSizeName.md,
    String? semanticLabel,
  }) : this._(
         DSIcons.integrationsApply,
         key: key,
         type: type,
         size: size,
         semanticLabel: semanticLabel,
       );

  const DSIcon.logout({
    Key? key,
    DSIconType type = DSIconType.normal,
    DSIconSizeName size = DSIconSizeName.md,
    String? semanticLabel,
  }) : this._(
         DSIcons.logout,
         key: key,
         type: type,
         size: size,
         semanticLabel: semanticLabel,
       );

  // Acciones
  const DSIcon.add({
    Key? key,
    DSIconType type = DSIconType.normal,
    DSIconSizeName size = DSIconSizeName.md,
    String? semanticLabel,
  }) : this._(
         DSIcons.add,
         key: key,
         type: type,
         size: size,
         semanticLabel: semanticLabel,
       );

  const DSIcon.check({
    Key? key,
    DSIconType type = DSIconType.normal,
    DSIconSizeName size = DSIconSizeName.md,
    String? semanticLabel,
  }) : this._(
         DSIcons.check,
         key: key,
         type: type,
         size: size,
         semanticLabel: semanticLabel,
       );

  const DSIcon.approved({
    Key? key,
    DSIconType type = DSIconType.normal,
    DSIconSizeName size = DSIconSizeName.md,
    String? semanticLabel,
  }) : this._(
         DSIcons.approved,
         key: key,
         type: type,
         size: size,
         semanticLabel: semanticLabel,
       );

  const DSIcon.close({
    Key? key,
    DSIconType type = DSIconType.normal,
    DSIconSizeName size = DSIconSizeName.md,
    String? semanticLabel,
  }) : this._(
         DSIcons.close,
         key: key,
         type: type,
         size: size,
         semanticLabel: semanticLabel,
       );

  const DSIcon.checkBoxSelected({
    Key? key,
    DSIconType type = DSIconType.normal,
    DSIconSizeName size = DSIconSizeName.md,
    String? semanticLabel,
  }) : this._(
         DSIcons.checkBoxSelected,
         key: key,
         type: type,
         size: size,
         semanticLabel: semanticLabel,
       );

  const DSIcon.checkBox({
    Key? key,
    DSIconType type = DSIconType.normal,
    DSIconSizeName size = DSIconSizeName.md,
    String? semanticLabel,
  }) : this._(
         DSIcons.checkBox,
         key: key,
         type: type,
         size: size,
         semanticLabel: semanticLabel,
       );

  const DSIcon.circularAvatarNumber({
    Key? key,
    DSIconType type = DSIconType.normal,
    DSIconSizeName size = DSIconSizeName.md,
    String? semanticLabel,
  }) : this._(
         DSIcons.circularAvatarNumber,
         key: key,
         type: type,
         size: size,
         semanticLabel: semanticLabel,
       );

  // Mensajes / bots
  const DSIcon.message({
    Key? key,
    DSIconType type = DSIconType.normal,
    DSIconSizeName size = DSIconSizeName.md,
    String? semanticLabel,
  }) : this._(
         DSIcons.message,
         key: key,
         type: type,
         size: size,
         semanticLabel: semanticLabel,
       );

  const DSIcon.aiBot({
    Key? key,
    DSIconType type = DSIconType.normal,
    DSIconSizeName size = DSIconSizeName.md,
    String? semanticLabel,
  }) : this._(
         DSIcons.aiBot,
         key: key,
         type: type,
         size: size,
         semanticLabel: semanticLabel,
       );

  const DSIcon.integrationWorkflow({
    Key? key,
    DSIconType type = DSIconType.normal,
    DSIconSizeName size = DSIconSizeName.md,
    String? semanticLabel,
  }) : this._(
         DSIcons.integrationWorkflow,
         key: key,
         type: type,
         size: size,
         semanticLabel: semanticLabel,
       );

  const DSIcon.notification({
    Key? key,
    DSIconType type = DSIconType.normal,
    DSIconSizeName size = DSIconSizeName.md,
    String? semanticLabel,
  }) : this._(
         DSIcons.notification,
         key: key,
         type: type,
         size: size,
         semanticLabel: semanticLabel,
       );

  // Sistema
  const DSIcon.configuration({
    Key? key,
    DSIconType type = DSIconType.normal,
    DSIconSizeName size = DSIconSizeName.md,
    String? semanticLabel,
  }) : this._(
         DSIcons.configuration,
         key: key,
         type: type,
         size: size,
         semanticLabel: semanticLabel,
       );

  const DSIcon.search({
    Key? key,
    DSIconType type = DSIconType.normal,
    DSIconSizeName size = DSIconSizeName.md,
    String? semanticLabel,
  }) : this._(
         DSIcons.search,
         key: key,
         type: type,
         size: size,
         semanticLabel: semanticLabel,
       );

  const DSIcon.back({
    Key? key,
    DSIconType type = DSIconType.normal,
    DSIconSizeName size = DSIconSizeName.md,
    String? semanticLabel,
  }) : this._(
         DSIcons.back,
         key: key,
         type: type,
         size: size,
         semanticLabel: semanticLabel,
       );

  const DSIcon.next({
    Key? key,
    DSIconType type = DSIconType.normal,
    DSIconSizeName size = DSIconSizeName.md,
    String? semanticLabel,
  }) : this._(
         DSIcons.next,
         key: key,
         type: type,
         size: size,
         semanticLabel: semanticLabel,
       );

  const DSIcon.arrowDropDown({
    Key? key,
    DSIconType type = DSIconType.normal,
    DSIconSizeName size = DSIconSizeName.md,
    String? semanticLabel,
  }) : this._(
         DSIcons.arrowDropDown,
         key: key,
         type: type,
         size: size,
         semanticLabel: semanticLabel,
       );

  const DSIcon.profile({
    Key? key,
    DSIconType type = DSIconType.normal,
    DSIconSizeName size = DSIconSizeName.md,
    String? semanticLabel,
  }) : this._(
         DSIcons.profile,
         key: key,
         type: type,
         size: size,
         semanticLabel: semanticLabel,
       );

  const DSIcon.addRounded({
    Key? key,
    DSIconType type = DSIconType.normal,
    DSIconSizeName size = DSIconSizeName.md,
    String? semanticLabel,
  }) : this._(
         DSIcons.addRounded,
         key: key,
         type: type,
         size: size,
         semanticLabel: semanticLabel,
       );

  // ──────────────────────── base privada ────────────────────────
  const DSIcon._(
    this.icon, {
    Key? key,
    this.type = DSIconType.normal,
    this.size = DSIconSizeName.md,
    this.semanticLabel,
  }) : super(key: key);

  final IconData icon;
  final DSIconType type;
  final DSIconSizeName size;
  final String? semanticLabel;

  // para cambiar tono/tamaño desde otros átomos (p.ej. botones del sidebar)
  DSIcon copyWith({DSIconType? type, DSIconSizeName? size}) {
    return DSIcon._(
      icon,
      type: type ?? this.type,
      size: size ?? this.size,
      semanticLabel: semanticLabel,
    );
  }

  double _px(DSIconSizeName s) => switch (s) {
    DSIconSizeName.xs => DSIconSize.xs,
    DSIconSizeName.sm => DSIconSize.sm,
    DSIconSizeName.md => DSIconSize.md,
    DSIconSizeName.lg => DSIconSize.lg,
    DSIconSizeName.xl => DSIconSize.xl,
    DSIconSizeName.xxl => DSIconSize.xxl,
  };

  Color _color(DSIconType t, ColorScheme cs) => switch (t) {
    DSIconType.normal => DSIconColors.normal(cs),
    DSIconType.surface => DSIconColors.surface(cs),
    DSIconType.disabled => DSIconColors.disabled(cs),
    DSIconType.selected => DSIconColors.selected(cs),
    DSIconType.warning => DSIconColors.warning(cs),
    DSIconType.error => DSIconColors.error(cs),
  };

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Icon(
      icon,
      size: _px(size),
      color: _color(type, cs),
      semanticLabel: semanticLabel,
    );
  }
}
