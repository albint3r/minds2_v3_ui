// lib/core/presentation/design_system/app_theme.dart
import "package:flutter/material.dart";
import "package:minds2_ui_v3/core/presentation/design_system/tokens/color_tokens.dart";

class ColorSchemeConfig {
  ColorSchemeConfig._();

  static ColorScheme get lightScheme => ColorScheme(
    brightness: Brightness.light,

    // Acento principal (naranja de marca)
    primary: DSColors.primary.brand[500]!,
    onPrimary: DSColors.primary.ink[25]!,

    // Acento secundario (azules / tablas)
    secondary: DSColors.secondary.table[600]!,
    onSecondary: DSColors.primary.ink[25]!,

    // Estados
    error: DSColors.alert.error[500]!,
    onError: DSColors.primary.ink[25]!,
    tertiary: DSColors.alert.warning[700]!,
    onTertiary: DSColors.primary.ink[25]!,

    // Superficies / texto
    surface: DSColors.primary.ink[25]!,
    // base clara
    onSurface: DSColors.primary.ink[900]!,
    // texto principal
    surfaceContainerHighest: DSColors.primary.ink[50]!,
    // fills suaves

    // Bordes
    outline: DSColors.primary.ink[200]!,
    outlineVariant: DSColors.primary.ink[100]!,

    // Inversos
    inverseSurface: DSColors.primary.ink[900]!,
    onInverseSurface: DSColors.primary.ink[25]!,
    inversePrimary: DSColors.primary.brand[600]!,

    // Sombras / scrim (solo tokens del DS)
    shadow: DSColors.primary.ink[900]!,
    scrim: DSColors.primary.ink[900]!,
  );
}
