// lib/core/presentation/design_system/theme/input_theme.dart
import "package:flutter/material.dart";
import "package:minds2_ui_v3/core/presentation/design_system/tokens/spacing_tokens.dart";
import "package:minds2_ui_v3/core/presentation/design_system/tokens/radius_tokens.dart";

InputDecorationTheme buildDSInputDecorationTheme({
  required ColorScheme colorScheme,
  required TextTheme textTheme,
}) {
  OutlineInputBorder _o(Color c) => OutlineInputBorder(
    borderRadius: BorderRadius.circular(DSRadius.xl), // 20
    borderSide: BorderSide(color: c, width: 1.5),
  );

  // 🟢 Fill blanco (como Figma) y gris solo cuando está deshabilitado
  final MaterialStateColor fill = MaterialStateColor.resolveWith((states) {
    if (states.contains(MaterialState.disabled)) {
      return colorScheme.surfaceContainerHighest; // gris muy suave deshabilitado
    }
    return colorScheme.surface; // blanco (o casi blanco) del scheme
  });

  return InputDecorationTheme(
    isDense: true,
    contentPadding: const EdgeInsets.symmetric(
      horizontal: DSSpacing.lg, // 24
      vertical: DSSpacing.sm,   // 8
    ),

    // Tipografía/colores (placeholders grises, texto negro/ink)
    hintStyle: textTheme.bodyMedium?.copyWith(
      color: colorScheme.onSurface.withValues(alpha: 0.48),
      fontWeight: FontWeight.w300,
    ),
    labelStyle: textTheme.bodySmall?.copyWith(
      color: colorScheme.onSurface.withValues(alpha: 0.72),
    ),
    errorStyle: textTheme.bodySmall?.copyWith(
      color: colorScheme.error,
      fontWeight: FontWeight.w500,
    ),

    // Iconos tenues
    prefixIconColor: colorScheme.onSurface.withValues(alpha: 0.48),
    suffixIconColor: colorScheme.onSurface.withValues(alpha: 0.48),

    // Bordes por estado (gris suave, focus azul, error rojo)
    enabledBorder: _o(colorScheme.outlineVariant),          // gris suave
    focusedBorder: _o(colorScheme.secondary),               // azul (match Figma)
    errorBorder: _o(colorScheme.error),                     // rojo
    focusedErrorBorder: _o(colorScheme.error),
    disabledBorder: _o(colorScheme.outline.withValues(alpha: 0.40)),

    // Relleno por estado
    filled: true,
    fillColor: fill,
  );
}
