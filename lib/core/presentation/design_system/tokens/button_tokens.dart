import "package:flutter/material.dart";
import "package:minds2_ui_v3/core/presentation/design_system/tokens/color_tokens.dart";
import "package:minds2_ui_v3/core/presentation/design_system/tokens/spacing_tokens.dart";
import "package:minds2_ui_v3/core/presentation/design_system/tokens/typography_tokens.dart";

class DSButtonTokens {
  // 🔹 Dimensiones (aquí luego los movemos a spacing_tokens.dart si existe)
  static const double radius = 20.0;

  static EdgeInsets get padding => const EdgeInsets.symmetric(
    horizontal: DSSpacing.lg,
    vertical: DSSpacing.sm,
  );
  static const double minWidth = 160.0; // ya lo tienes
  static const double minHeight = 48.0; // altura estándar de Figma

  // 🔹 Colores
  static Color get primaryBg => DSColors.primary.brand[500]!;

  static Color get primaryLabel => DSColors.primary.brand[25]!;

  static Color get outlineBorder => DSColors.primary.brand[500]!;

  static Color get outlineLabel => DSColors.primary.brand[500]!;

  static Color get disable => DSColors.primary.ink[200]!;

  static Color get darkBg => DSColors.primary.ink[500]!;

  static Color get darkLabel => DSColors.primary.brand[25]!;

  // 🔹 Tipografía oficial (de DSTypography)
  static TextStyle get label => DSTypography.textTheme.labelLarge!;
}
