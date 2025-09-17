import "package:flutter/material.dart";
import "package:minds2_ui_v3/core/presentation/design_system/theme/color_scheme_config.dart";

// import "app_theme.dart"; // <- donde definiste AppTheme.lightScheme / darkScheme

// @singleton
class ThemeConfig {
  ThemeData get light =>
      _getThemeData(colorScheme: ColorSchemeConfig.lightScheme);

  // Si aún no tienes darkScheme, puedes usar: AppTheme.lightScheme
  // ThemeData get dark => _getThemeData(colorScheme: AppTheme.darkScheme);

  ThemeData _getThemeData({required ColorScheme colorScheme}) {
    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      // En M3 el fondo base debe venir de surface (no de primary)
      scaffoldBackgroundColor: colorScheme.surface,
      brightness: colorScheme.brightness,
      visualDensity: VisualDensity.standard,

      // // Tus temas por componente, reciben el mismo scheme del DS:
      // elevatedButtonTheme: CustomElevatedButtonThemeData.themeData(colorScheme),
      // textTheme: TextThemeData.themeData(colorScheme),
      // inputDecorationTheme: CustomInputDecoratorThemeData.themeData(colorScheme),
      // scrollbarTheme: CustomScrollbarThemeData.themeData(colorScheme),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: colorScheme.secondary),
      ),

      // Evitar withOpacity (deprecado) → withValues(alpha: …)
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: colorScheme.primaryContainer,
        selectionColor: colorScheme.secondary.withValues(alpha: 0.40),
        selectionHandleColor: colorScheme.secondary.withValues(alpha: 0.40),
      ),

      // dataTableTheme: CustomDataTableThemeData.themeData(colorScheme),
    );
  }
}
