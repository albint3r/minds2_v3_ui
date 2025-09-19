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
    String? message,
  }) : this._(
         DSIcons.home,
         key: key,
         type: type,
         size: size,
         semanticLabel: semanticLabel,
         message: message,
       );

  const DSIcon.conversation({
    Key? key,
    DSIconType type = DSIconType.normal,
    DSIconSizeName size = DSIconSizeName.md,
    String? semanticLabel,
    String? message,
  }) : this._(
         DSIcons.conversation,
         key: key,
         type: type,
         size: size,
         semanticLabel: semanticLabel,
         message: message,
       );

  // Usuario
  const DSIcon.contact({
    Key? key,
    DSIconType type = DSIconType.normal,
    DSIconSizeName size = DSIconSizeName.md,
    String? semanticLabel,
    String? message,
  }) : this._(
         DSIcons.contact,
         key: key,
         type: type,
         size: size,
         semanticLabel: semanticLabel,
         message: message,
       );

  const DSIcon.funnel({
    Key? key,
    DSIconType type = DSIconType.normal,
    DSIconSizeName size = DSIconSizeName.md,
    String? semanticLabel,
    String? message,
  }) : this._(
         DSIcons.funnel,
         key: key,
         type: type,
         size: size,
         semanticLabel: semanticLabel,
         message: message,
       );

  const DSIcon.calendar({
    Key? key,
    DSIconType type = DSIconType.normal,
    DSIconSizeName size = DSIconSizeName.md,
    String? semanticLabel,
    String? message,
  }) : this._(
         DSIcons.calendar,
         key: key,
         type: type,
         size: size,
         semanticLabel: semanticLabel,
         message: message,
       );

  const DSIcon.campaign({
    Key? key,
    DSIconType type = DSIconType.normal,
    DSIconSizeName size = DSIconSizeName.md,
    String? semanticLabel,
    String? message,
  }) : this._(
         DSIcons.campaign,
         key: key,
         type: type,
         size: size,
         semanticLabel: semanticLabel,
         message: message,
       );

  const DSIcon.aiBuilder({
    Key? key,
    DSIconType type = DSIconType.normal,
    DSIconSizeName size = DSIconSizeName.md,
    String? semanticLabel,
    String? message,
  }) : this._(
         DSIcons.aiBuilder,
         key: key,
         type: type,
         size: size,
         semanticLabel: semanticLabel,
         message: message,
       );

  const DSIcon.integrations({
    Key? key,
    DSIconType type = DSIconType.normal,
    DSIconSizeName size = DSIconSizeName.md,
    String? semanticLabel,
    String? message,
  }) : this._(
         DSIcons.integrations,
         key: key,
         type: type,
         size: size,
         semanticLabel: semanticLabel,
         message: message,
       );

  const DSIcon.team({
    Key? key,
    DSIconType type = DSIconType.normal,
    DSIconSizeName size = DSIconSizeName.md,
    String? semanticLabel,
    String? message,
  }) : this._(
         DSIcons.team,
         key: key,
         type: type,
         size: size,
         semanticLabel: semanticLabel,
         message: message,
       );

  const DSIcon.billing({
    Key? key,
    DSIconType type = DSIconType.normal,
    DSIconSizeName size = DSIconSizeName.md,
    String? semanticLabel,
    String? message,
  }) : this._(
         DSIcons.billing,
         key: key,
         type: type,
         size: size,
         semanticLabel: semanticLabel,
         message: message,
       );

  const DSIcon.integrationsApply({
    Key? key,
    DSIconType type = DSIconType.normal,
    DSIconSizeName size = DSIconSizeName.md,
    String? semanticLabel,
    String? message,
  }) : this._(
         DSIcons.integrationsApply,
         key: key,
         type: type,
         size: size,
         semanticLabel: semanticLabel,
         message: message,
       );

  const DSIcon.logout({
    Key? key,
    DSIconType type = DSIconType.normal,
    DSIconSizeName size = DSIconSizeName.md,
    String? semanticLabel,
    String? message,
  }) : this._(
         DSIcons.logout,
         key: key,
         type: type,
         size: size,
         semanticLabel: semanticLabel,
         message: message,
       );

  // Acciones
  const DSIcon.add({
    Key? key,
    DSIconType type = DSIconType.normal,
    DSIconSizeName size = DSIconSizeName.md,
    String? semanticLabel,
    String? message,
  }) : this._(
         DSIcons.add,
         key: key,
         type: type,
         size: size,
         semanticLabel: semanticLabel,
         message: message,
       );

  const DSIcon.check({
    Key? key,
    DSIconType type = DSIconType.normal,
    DSIconSizeName size = DSIconSizeName.md,
    String? semanticLabel,
    String? message,
  }) : this._(
         DSIcons.check,
         key: key,
         type: type,
         size: size,
         semanticLabel: semanticLabel,
         message: message,
       );

  const DSIcon.approved({
    Key? key,
    DSIconType type = DSIconType.normal,
    DSIconSizeName size = DSIconSizeName.md,
    String? semanticLabel,
    String? message,
  }) : this._(
         DSIcons.approved,
         key: key,
         type: type,
         size: size,
         semanticLabel: semanticLabel,
         message: message,
       );

  const DSIcon.close({
    Key? key,
    DSIconType type = DSIconType.normal,
    DSIconSizeName size = DSIconSizeName.md,
    String? semanticLabel,
    String? message,
  }) : this._(
         DSIcons.close,
         key: key,
         type: type,
         size: size,
         semanticLabel: semanticLabel,
         message: message,
       );

  const DSIcon.checkBoxSelected({
    Key? key,
    DSIconType type = DSIconType.normal,
    DSIconSizeName size = DSIconSizeName.md,
    String? semanticLabel,
    String? message,
  }) : this._(
         DSIcons.checkBoxSelected,
         key: key,
         type: type,
         size: size,
         semanticLabel: semanticLabel,
         message: message,
       );

  const DSIcon.checkBox({
    Key? key,
    DSIconType type = DSIconType.normal,
    DSIconSizeName size = DSIconSizeName.md,
    String? semanticLabel,
    String? message,
  }) : this._(
         DSIcons.checkBox,
         key: key,
         type: type,
         size: size,
         semanticLabel: semanticLabel,
         message: message,
       );

  const DSIcon.circularAvatarNumber({
    Key? key,
    DSIconType type = DSIconType.normal,
    DSIconSizeName size = DSIconSizeName.md,
    String? semanticLabel,
    String? message,
  }) : this._(
         DSIcons.circularAvatarNumber,
         key: key,
         type: type,
         size: size,
         semanticLabel: semanticLabel,
         message: message,
       );

  // Mensajes / bots
  const DSIcon.message({
    Key? key,
    DSIconType type = DSIconType.normal,
    DSIconSizeName size = DSIconSizeName.md,
    String? semanticLabel,
    String? message,
  }) : this._(
         DSIcons.message,
         key: key,
         type: type,
         size: size,
         semanticLabel: semanticLabel,
         message: message,
       );

  const DSIcon.aiBot({
    Key? key,
    DSIconType type = DSIconType.normal,
    DSIconSizeName size = DSIconSizeName.md,
    String? semanticLabel,
    String? message,
  }) : this._(
         DSIcons.aiBot,
         key: key,
         type: type,
         size: size,
         semanticLabel: semanticLabel,
         message: message,
       );

  const DSIcon.integrationWorkflow({
    Key? key,
    DSIconType type = DSIconType.normal,
    DSIconSizeName size = DSIconSizeName.md,
    String? semanticLabel,
    String? message,
  }) : this._(
         DSIcons.integrationWorkflow,
         key: key,
         type: type,
         size: size,
         semanticLabel: semanticLabel,
         message: message,
       );

  const DSIcon.notification({
    Key? key,
    DSIconType type = DSIconType.normal,
    DSIconSizeName size = DSIconSizeName.md,
    String? semanticLabel,
    String? message,
  }) : this._(
         DSIcons.notification,
         key: key,
         type: type,
         size: size,
         semanticLabel: semanticLabel,
         message: message,
       );

  // Sistema
  const DSIcon.configuration({
    Key? key,
    DSIconType type = DSIconType.normal,
    DSIconSizeName size = DSIconSizeName.md,
    String? semanticLabel,
    String? message,
  }) : this._(
         DSIcons.configuration,
         key: key,
         type: type,
         size: size,
         semanticLabel: semanticLabel,
         message: message,
       );

  const DSIcon.supportAgent({
    Key? key,
    DSIconType type = DSIconType.normal,
    DSIconSizeName size = DSIconSizeName.md,
    String? semanticLabel,
    String? message,
  }) : this._(
         DSIcons.supportAgent,
         key: key,
         type: type,
         size: size,
         semanticLabel: semanticLabel,
         message: message,
       );

  const DSIcon.search({
    Key? key,
    DSIconType type = DSIconType.normal,
    DSIconSizeName size = DSIconSizeName.md,
    String? semanticLabel,
    String? message,
  }) : this._(
         DSIcons.search,
         key: key,
         type: type,
         size: size,
         semanticLabel: semanticLabel,
         message: message,
       );

  const DSIcon.back({
    Key? key,
    DSIconType type = DSIconType.normal,
    DSIconSizeName size = DSIconSizeName.md,
    String? semanticLabel,
    String? message,
  }) : this._(
         DSIcons.back,
         key: key,
         type: type,
         size: size,
         semanticLabel: semanticLabel,
         message: message,
       );

  const DSIcon.next({
    Key? key,
    DSIconType type = DSIconType.normal,
    DSIconSizeName size = DSIconSizeName.md,
    String? semanticLabel,
    String? message,
  }) : this._(
         DSIcons.next,
         key: key,
         type: type,
         size: size,
         semanticLabel: semanticLabel,
         message: message,
       );

  const DSIcon.arrowDropDown({
    Key? key,
    DSIconType type = DSIconType.normal,
    DSIconSizeName size = DSIconSizeName.md,
    String? semanticLabel,
    String? message,
  }) : this._(
         DSIcons.arrowDropDown,
         key: key,
         type: type,
         size: size,
         semanticLabel: semanticLabel,
         message: message,
       );

  const DSIcon.profile({
    Key? key,
    DSIconType type = DSIconType.normal,
    DSIconSizeName size = DSIconSizeName.md,
    String? semanticLabel,
    String? message,
  }) : this._(
         DSIcons.profile,
         key: key,
         type: type,
         size: size,
         semanticLabel: semanticLabel,
         message: message,
       );

  const DSIcon.addRounded({
    Key? key,
    DSIconType type = DSIconType.normal,
    DSIconSizeName size = DSIconSizeName.md,
    String? semanticLabel,
    String? message,
  }) : this._(
         DSIcons.addRounded,
         key: key,
         type: type,
         size: size,
         semanticLabel: semanticLabel,
         message: message,
       );

  // ──────────────────────── base privada ────────────────────────
  const DSIcon._(
    this.icon, {
    super.key,
    this.type = DSIconType.normal,
    this.size = DSIconSizeName.md,
    this.semanticLabel,
    this.message,
  });

  final IconData icon;
  final DSIconType type;
  final DSIconSizeName size;
  final String? semanticLabel;
  final String? message;

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
    return Tooltip(
      message: message ?? "",
      child: Icon(
        icon,
        size: _px(size),
        color: _color(type, cs),
        semanticLabel: semanticLabel,
      ),
    );
  }
}
