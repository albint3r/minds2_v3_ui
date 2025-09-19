// lib/core/presentation/design_system/theme/input_theme.dart
import "package:flutter/material.dart";
import "package:minds2_ui_v3/core/presentation/design_system/tokens/radius_tokens.dart";
import "package:minds2_ui_v3/core/presentation/design_system/tokens/spacing_tokens.dart";

InputDecorationTheme buildDSInputDecorationTheme({
  required ColorScheme colorScheme,
  required TextTheme textTheme,
}) {
  OutlineInputBorder _o(Color c) => OutlineInputBorder(
    borderRadius: BorderRadius.circular(DSRadius.xl), // 20
    borderSide: BorderSide(color: c, width: 1.5),
  );

  final MaterialStateColor fill = MaterialStateColor.resolveWith((states) {
    if (states.contains(MaterialState.disabled)) {
      return colorScheme.surfaceContainerHighest;
    }
    return colorScheme.surface; // blanco
  });

  return InputDecorationTheme(
    isDense: true,
    contentPadding: const EdgeInsets.symmetric(
      horizontal: DSSpacing.lg, // 24
      vertical: DSSpacing.sm,   // 8
    ),

    // Tipografía/colores
    hintStyle: textTheme.bodyMedium?.copyWith(
      color: colorScheme.onSurface.withValues(alpha: 0.48),
      fontWeight: FontWeight.w300,
    ),

    // ✅ Label con "paragraph" (labelSmall) y SIN subrayado
    labelStyle: textTheme.labelSmall?.copyWith(
      color: colorScheme.onSurface.withValues(alpha: 0.72),
      decoration: TextDecoration.none,
    ),
    floatingLabelStyle: textTheme.labelSmall?.copyWith(
      color: colorScheme.secondary, // o primary, según tu Figma
      decoration: TextDecoration.none,
    ),

    errorStyle: textTheme.bodySmall?.copyWith(
      color: colorScheme.error,
      fontWeight: FontWeight.w500,
    ),

    // Iconos tenues
    prefixIconColor: colorScheme.onSurface.withValues(alpha: 0.48),
    suffixIconColor: colorScheme.onSurface.withValues(alpha: 0.48),

    // Bordes por estado
    enabledBorder: _o(colorScheme.outlineVariant),
    focusedBorder: _o(colorScheme.secondary),
    errorBorder: _o(colorScheme.error),
    focusedErrorBorder: _o(colorScheme.error),
    disabledBorder: _o(colorScheme.outline.withValues(alpha: 0.40)),

    // Relleno por estado
    filled: true,
    fillColor: fill,
  );
}
