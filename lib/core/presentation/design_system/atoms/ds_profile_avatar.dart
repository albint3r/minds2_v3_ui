import "package:flutter/material.dart";
import "package:minds2_ui_v3/core/presentation/design_system/atoms/ds_text.dart";
import "package:minds2_ui_v3/core/presentation/design_system/tokens/color_tokens.dart";

/// Átomo: avatar circular genérico (foto por URL o inicial por nombre)
class DSProfileAvatar extends StatelessWidget {
  const DSProfileAvatar({
    super.key,
    this.name,
    this.imageUrl,
    this.diameter = 48,
    this.onTap,
    this.tooltip,
    this.showBorder = true,
  }) : assert(
  (name != null && name != "") || (imageUrl != null && imageUrl != ""),
  "Debes pasar name o imageUrl",
  );

  /// Nombre completo (se usará la inicial si no hay imagen).
  final String? name;

  /// URL de la foto. Si falla, cae a inicial.
  final String? imageUrl;

  /// Diámetro del avatar.
  final double diameter;

  /// Tap callback (p.ej. navegar al perfil).
  final VoidCallback? onTap;

  /// Tooltip opcional al pasar el mouse / long-press.
  final String? tooltip;

  /// Muestra borde fino del DS.
  final bool showBorder;

  String get _initial {
    final s = (name ?? "").trim();
    if (s.isEmpty) return "?";
    final m = RegExp(r"[A-Za-zÁÉÍÓÚÜÑäëïöü]").firstMatch(s);
    return (m != null ? m.group(0)! : s.characters.first).toUpperCase();
  }

  bool get _hasUrl => (imageUrl != null && imageUrl!.trim().isNotEmpty);

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final bg = cs.surfaceContainerHighest;          // fondo claro
    final border = cs.outlineVariant;               // borde suave
    final ink = DSColors.primary.ink[500]!;         // azul DS

    Widget avatar = Container(
      width: diameter,
      height: diameter,
      decoration: BoxDecoration(
        color: bg,
        shape: BoxShape.circle,
        border: showBorder ? Border.all(color: border, width: 1) : null,
      ),
      clipBehavior: Clip.antiAlias,
      child: _hasUrl
          ? Image.network(
        imageUrl!,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => _InitialLetter(color: ink),
      )
          : _InitialLetter(color: ink),
    );

    if (onTap != null) {
      avatar = InkWell(
        borderRadius: BorderRadius.circular(diameter / 2),
        onTap: onTap,
        child: avatar,
      );
    }

    if (tooltip != null && tooltip!.isNotEmpty) {
      avatar = Tooltip(message: tooltip!, child: avatar);
    }

    return avatar;
  }

  Widget _InitialLetter({required Color color}) {
    // Escala el texto para caber bien
    return Center(child: DSText.heading3(_initial, color: color));
  }
}
