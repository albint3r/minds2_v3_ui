import "package:flutter/material.dart";
import "package:minds2_ui_v3/core/presentation/design_system/tokens/card_tokens.dart";

// lib/core/presentation/design_system/atoms/ds_card.dart
class DSCard extends StatelessWidget {
  const DSCard({
    super.key,
    required this.child,
    this.padding,
    this.radius,
    this.borderColor,
    this.backgroundColor,
    this.minWidth,
    this.minHeight,
    this.maxWidth,         // opcional por componente
    this.expand = false,   // 👉 full-width solo si se pide
  });

  final Widget child;
  final EdgeInsets? padding;
  final double? radius;
  final Color? borderColor;
  final Color? backgroundColor;
  final double? minWidth;
  final double? minHeight;
  final double? maxWidth;
  final bool expand;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    final constraints = expand
        ? BoxConstraints( // ocupa todo lo que le den
      minHeight: minHeight ?? DSCardTokens.minHeight,
    )
        : BoxConstraints(
      minWidth: minWidth ?? DSCardTokens.minWidth,
      maxWidth: maxWidth ?? DSCardTokens.maxWidth, // 🔒 aquí se limita
      minHeight: minHeight ?? DSCardTokens.minHeight,
    );

    return Align( // evita que se “estire” al centro
      alignment: Alignment.topLeft,
      child: ConstrainedBox(
        constraints: constraints,
        child: Container(
          padding: padding ?? DSCardTokens.padding,
          decoration: BoxDecoration(
            color: backgroundColor ?? cs.surface,
            borderRadius: BorderRadius.circular(radius ?? DSCardTokens.radius),
            border: Border.all(
              color: borderColor ?? cs.outlineVariant,
              width: DSCardTokens.borderWidth,
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
