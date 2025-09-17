import "package:flutter/material.dart";
import "package:minds2_ui_v3/core/presentation/design_system/theme/color_scheme_config.dart";
import "package:minds2_ui_v3/core/presentation/design_system/tokens/icon_tokens.dart";
import "package:minds2_ui_v3/core/presentation/design_system/tokens/typography_tokens.dart";

class ThemeConfig {
  ThemeData get light =>
      _getThemeData(colorScheme: ColorSchemeConfig.lightScheme);

  ThemeData _getThemeData({required ColorScheme colorScheme}) {
    final tt = DSTypography.textTheme.apply(
      bodyColor: colorScheme.onSurface,
      displayColor: colorScheme.onSurface,
    );

    // Subrayado tipo DS para inputs
    UnderlineInputBorder _u(Color c) =>
        UnderlineInputBorder(borderSide: BorderSide(color: c, width: 1.2));

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: colorScheme.surface,
      brightness: colorScheme.brightness,
      visualDensity: VisualDensity.standard,

      // Tipografía de tokens
      textTheme: tt,

      // TextSelection (usa scheme, sin withOpacity)
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: colorScheme.primary,
        selectionColor: colorScheme.secondary.withValues(alpha: 0.40),
        selectionHandleColor: colorScheme.secondary.withValues(alpha: 0.40),
      ),

      // Subrayado SOLO en inputs (no en títulos)
      inputDecorationTheme: InputDecorationTheme(
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 8),
        hintStyle: tt.bodyLarge?.copyWith(
          color: colorScheme.onSurface.withValues(alpha: 0.48),
        ),
        labelStyle: tt.bodyLarge?.copyWith(
          color: colorScheme.onSurface.withValues(alpha: 0.72),
        ),
        floatingLabelStyle: tt.bodyLarge?.copyWith(
          color: colorScheme.primary,
          fontWeight: FontWeight.w500,
        ),
        enabledBorder: _u(colorScheme.outlineVariant),
        disabledBorder: _u(colorScheme.outline.withValues(alpha: 0.40)),
        focusedBorder: _u(colorScheme.primary),
        errorBorder: _u(colorScheme.error),
        focusedErrorBorder: _u(colorScheme.error),
      ),

      // Botones de texto
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: colorScheme.secondary,
          textStyle: tt.labelLarge,
        ),
      ),
      // añade a tu ThemeConfig (no cambies lo demás)
      iconTheme: IconThemeData(
        color: colorScheme.onSurface,
        size: DSIconSize.md,
      ),
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          foregroundColor: colorScheme.onSurface,
          disabledForegroundColor: DSIconColors.disabled(colorScheme),
          backgroundColor: Colors.transparent,
          splashFactory: InkRipple.splashFactory,
          padding: const EdgeInsets.all(8),
          minimumSize: const Size(40, 40), // target táctil
        ),
      ),

    );
  }
}
