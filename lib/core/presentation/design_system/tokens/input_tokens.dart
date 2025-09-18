import "package:flutter/material.dart";
import "package:minds2_ui_v3/core/presentation/design_system/tokens/color_tokens.dart";
import "package:minds2_ui_v3/core/presentation/design_system/tokens/radius_tokens.dart";
import "package:minds2_ui_v3/core/presentation/design_system/tokens/spacing_tokens.dart";
import "package:minds2_ui_v3/core/presentation/design_system/tokens/typography_tokens.dart";

class DSInputTokens {
  DSInputTokens._();

  // Dimensiones
  static EdgeInsets get contentPadding => const EdgeInsets.symmetric(
    horizontal: DSSpacing.lg, // 24
    vertical: DSSpacing.sm, // 8
  );

  static double get radius => DSRadius.xl; // 20

  // Colores de estado
  // gris suave
  static Color get borderEnabled => DSColors.secondary.table[200]!;

  // azul (focus)
  static Color get borderFocused => DSColors.secondary.table[600]!;

  static Color get borderError => DSColors.alert.error[500]!;

  static Color get borderDisabled => DSColors.secondary.table[200]!;

  static Color get fillEnabled => DSColors.secondary.table[50]!;

  static Color get fillDisabled => DSColors.secondary.table[50]!;

  static Color get textColor => DSColors.primary.ink[500]!;

  static Color get hintColor => DSColors.primary.ink[100]!;

  static Color get iconColor => DSColors.primary.ink[100]!;

  static Color get errorColor => DSColors.alert.error[500]!;

  // Tipografía
  static TextStyle get textStyle => DSTypography.textTheme.bodyMedium!;

  static TextStyle get hintStyle => DSTypography.textTheme.bodyMedium!.copyWith(
    color: hintColor,
    fontWeight: FontWeight.w300,
  );

  // etiqueta/placeholder si se usa
  static TextStyle get labelStyle => DSTypography.textTheme.bodySmall!;

  static TextStyle get errorStyle =>
      DSTypography.textTheme.bodySmall!.copyWith(color: errorColor);
}
