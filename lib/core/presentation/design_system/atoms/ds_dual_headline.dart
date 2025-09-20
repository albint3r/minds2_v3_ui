// lib/core/presentation/design_system/atoms/ds_dual_text.dart
import "package:flutter/material.dart";
import "package:minds2_ui_v3/core/presentation/design_system/atoms/ds_text.dart";
import "package:minds2_ui_v3/core/presentation/design_system/tokens/color_tokens.dart";

/// Dos líneas de texto con estilos distintos (ej. "WELCOME / BACK")
class DsDualText extends StatelessWidget {
  const DsDualText({
    super.key,
    required this.primary,
    required this.secondary,
    this.align = TextAlign.left,
  });

  final String primary;
  final String secondary;
  final TextAlign align;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 0,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DSText.heading1(
          primary,
          color: DSColors.primary.brand[500], // naranja
          textAlign: align,
        ),
        DSText.heading2(
          secondary,
          color: DSColors.primary.ink[25], // blanco
          textAlign: align,
        ),
      ],
    );
  }
}
