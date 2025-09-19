// lib/core/presentation/design_system/components/ds_avatar_stack.dart
import "package:flutter/material.dart";
import "package:minds2_ui_v3/core/presentation/design_system/atoms/ds_profile_avatar.dart";
import "package:minds2_ui_v3/core/presentation/design_system/atoms/ds_text.dart";
import "package:minds2_ui_v3/core/presentation/design_system/tokens/color_tokens.dart";

class DSAvatarStack extends StatelessWidget {
  const DSAvatarStack({
    super.key,
    required this.items,                 // cada item puede ser nombre o url
    this.size = 48,                      // diámetro por avatar
    this.overlapFraction = .35,          // 0..1  (cuánto se solapan)
    this.maxVisible = 3,                 // cuántos se ven antes de "+N"
    this.onTap,                          // callback por avatar
    this.tooltipBuilder,                 // opcional: tooltip por avatar
  }) : assert(overlapFraction >= 0 && overlapFraction < 1);

  final List<String> items;
  final double size;
  final double overlapFraction;
  final int maxVisible;
  final void Function(int index, String source)? onTap;
  final String Function(int index, String source)? tooltipBuilder;

  bool _isUrl(String s) {
    final t = s.trim().toLowerCase();
    return t.startsWith("http://") || t.startsWith("https://");
  }

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
              child: DSProfileAvatar(
                name: _isUrl(items[i]) ? null : items[i],
                imageUrl: _isUrl(items[i]) ? items[i] : null,
                diameter: size,
                tooltip: tooltipBuilder?.call(i, items[i]),
                onTap: onTap == null ? null : () => onTap!(i, items[i]),
              ),
            ),
          if (items.length > maxVisible)
            Positioned(
              left: (visible - 1) * step,
              child: _MoreBadge(
                count: items.length - maxVisible + 1, // incluye el último visual
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
    final bg = cs.surface;
    final border = cs.outlineVariant;
    final ink = DSColors.primary.ink[500]!;

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
