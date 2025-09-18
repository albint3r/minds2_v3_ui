// lib/core/presentation/design_system/components/ds_avatar_stack.dart
import "package:flutter/material.dart";
import "package:minds2_ui_v3/core/presentation/design_system/atoms/ds_text.dart";
import "package:minds2_ui_v3/core/presentation/design_system/tokens/color_tokens.dart";

/// Avatar individual (foto o inicial)
class DSAvatarCircle extends StatelessWidget {
  const DSAvatarCircle(
    this.source, {
    super.key,
    required this.size,
    this.onTap,
  });

  final String source; // nombre o URL
  final double size; // diámetro en px
  final void Function(String source)? onTap;

  bool get _isUrl {
    final s = source.trim().toLowerCase();
    return s.startsWith("http://") || s.startsWith("https://");
  }

  String get _initial {
    final s = source.trim();
    if (s.isEmpty) return "?";
    // toma primera letra que sea alfabética
    final m = RegExp(r"[A-Za-zÁÉÍÓÚÑ]").firstMatch(s);
    return (m != null ? m.group(0)! : s.characters.first).toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final bg = cs.surfaceContainerHighest; // círculo gris claro
    final border = cs.outlineVariant; // borde suave
    final textColor = DSColors.primary.ink[500]!; // azul de la marca

    final avatar = Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: bg,
        shape: BoxShape.circle,
        border: Border.all(color: border, width: 1),
      ),
      clipBehavior: Clip.antiAlias,
      child: _isUrl
          ? Image.network(
              source,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) =>
                  _FallbackLetter(textColor: textColor, letter: _initial),
            )
          : _FallbackLetter(textColor: textColor, letter: _initial),
    );

    return GestureDetector(
      onTap: onTap == null ? null : () => onTap!(source),
      child: avatar,
    );
  }
}

class _FallbackLetter extends StatelessWidget {
  const _FallbackLetter({required this.textColor, required this.letter});

  final Color textColor;
  final String letter;

  @override
  Widget build(BuildContext context) {
    return Center(child: DSText.filters(letter, color: textColor));
  }
}

/// Stack de avatares con solapamiento y contador "+N" al final
class DSAvatarStack extends StatelessWidget {
  const DSAvatarStack({
    super.key,
    required this.items,
    this.size = 48,
    this.overlapFraction = .35,
    this.maxVisible = 3,
    this.onTap,
  }) : assert(overlapFraction >= 0 && overlapFraction < 1);

  final List<String> items;
  final double size;
  final double overlapFraction;
  final int maxVisible;
  final void Function(int index, String source)? onTap;

  @override
  Widget build(BuildContext context) {
    final visible = items.length <= maxVisible ? items.length : maxVisible;
    final step = size * (1 - overlapFraction);
    final totalWidth = visible > 0 ? size + step * (visible - 1) : 0.0;

    return SizedBox(
      width: totalWidth,
      height: size,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          for (int i = 0; i < visible; i++)
            Positioned(
              left: i * step,
              child: DSAvatarCircle(
                items[i],
                size: size,
                onTap: onTap == null ? null : (src) => onTap!(i, src),
              ),
            ),
          if (items.length > maxVisible)
            Positioned(
              left: (visible - 1) * step,
              child: _MoreBadge(
                count: items.length - maxVisible + 1,
                // el último visual cuenta como "+N"
                size: size,
              ),
            ),
        ],
      ),
    );
  }
}

class _MoreBadge extends StatelessWidget {
  const _MoreBadge({required this.count, required this.size});

  final int count;
  final double size;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final bg = cs.surface; // blanco
    final border = cs.outlineVariant; // borde suave
    final ink = DSColors.primary.ink[500]!; // azul

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: bg,
        shape: BoxShape.circle,
        border: Border.all(color: border, width: 1),
      ),
      alignment: Alignment.center,
      child: DSText.labels("+$count", color: ink),
    );
  }
}
