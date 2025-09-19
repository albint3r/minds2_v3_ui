import "package:flutter/material.dart";
import "package:injectable/injectable.dart";
import "package:minds2_ui_v3/core/presentation/design_system/theme/color_scheme_config.dart";
import "package:minds2_ui_v3/core/presentation/design_system/theme/input_theme.dart";
import "package:minds2_ui_v3/core/presentation/design_system/tokens/icon_tokens.dart";
import "package:minds2_ui_v3/core/presentation/design_system/tokens/typography_tokens.dart";

@singleton
class ThemeConfig {
  ThemeData get light =>
      _getThemeData(colorScheme: ColorSchemeConfig.lightScheme);

  ThemeData _getThemeData({required ColorScheme colorScheme}) {
    final tt = DSTypography.textTheme.apply(
      bodyColor: colorScheme.onSurface,
      displayColor: colorScheme.onSurface,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: colorScheme.surface,
      brightness: colorScheme.brightness,
      visualDensity: VisualDensity.standard,

      // Tipografía de tokens
      textTheme: tt,

      // TextSelection
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: colorScheme.primary,
        selectionColor: colorScheme.secondary.withValues(alpha: 0.40),
        selectionHandleColor: colorScheme.secondary.withValues(alpha: 0.40),
      ),

      // ✅ TextFields (rounded outline via tokens)
      inputDecorationTheme: buildDSInputDecorationTheme(
        colorScheme: colorScheme,
        textTheme: tt,
      ),

      // Botones de texto
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: colorScheme.secondary,
          textStyle: tt.labelLarge,
        ),
      ),

      // Iconografía
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
          minimumSize: const Size(40, 40),
        ),
      ),
    );
  }
}
