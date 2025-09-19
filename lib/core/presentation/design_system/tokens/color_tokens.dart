import "package:flutter/material.dart";

/// Design System Colors (Minds2)
/// ----------------------------
/// Paleta centralizada para todo el proyecto.
/// - Primary (brand + text/ink)
/// - Secondary (gradient + table)
/// - Alert (error/success/warning)
class DSColors {
  DSColors._(); // sólo como namespace

  static const primary = _PrimaryColors();
  static const secondary = _SecondaryColors();
  static const alert = _AlertColors();
}

/// ----------------------------
/// PRIMARY
/// ----------------------------
class _PrimaryColors {
  const _PrimaryColors();

  /// Botones principales y notificaciones
  final Map<int, Color> brand = const {
    25: Color(0xFFFFFFFF),
    50: Color(0xFFFF8A00),
    100: Color(0xFFFFD099),
    200: Color(0xFFFFD099),
    300: Color(0xFFFFB966),
    400: Color(0xFFF5A13D),
    500: Color(0xFFFF8A00),
    600: Color(0xFFCC7700),
    700: Color(0xFF995900),
    800: Color(0xFF663C00),
    900: Color(0xFF331C00),
  };

  /// Tipografía y elementos seleccionados
  final Map<int, Color> ink = const {
    25: Color(0xFFFCFCFD),
    50: Color(0xFFCCD7E5),
    100: Color(0xFF8CA5C4),
    200: Color(0xFF6B8BB3),
    300: Color(0xFF4F719B),
    400: Color(0xFF3E5879),
    500: Color(0xFF2D4058),
    600: Color(0xFF1C2736),
    700: Color(0xFF0A0C14),
    800: Color(0xFF0C0A14),
    900: Color(0xFF0A0F14),
  };
}

/// ----------------------------
/// SECONDARY
/// ----------------------------
class _SecondaryColors {
  const _SecondaryColors();

  /// Gradiente (menú lateral / CTA)
  final List<Color> gradient = const [
    Color(0xFF497ABE),
    Color(0xFF6690CC),
    Color(0xFF497ABE),
    Color(0xFF1C2836),
  ];

  /// Rampa para filas de tablas
  final Map<int, Color> table = const {
    25: Color(0xFFFFFFFF),
    50: Color(0xFFF1F2F3),
    100: Color(0xFF172236),
    200: Color(0xFFE6EBF4),
    300: Color(0xFFCEDBF3),
    400: Color(0xFFC9D9F8),
    500: Color(0xFF95B7F8),
    600: Color(0xFF0047CC),
    700: Color(0xFF003699),
    800: Color(0xFF002466),
    900: Color(0xFF001233),
  };
}

/// ----------------------------
/// ALERTS
/// ----------------------------
class _AlertColors {
  const _AlertColors();

  /// ❌ Error (rampa roja consistente)
  final Map<int, Color> error = const {
    25: Color(0xFFFFF5F5),
    50: Color(0xFFFFE5E5),
    100: Color(0xFFFFCCCC),
    200: Color(0xFFFFB3B3),
    300: Color(0xFFFF8080),
    400: Color(0xFFFF4D4D),
    500: Color(0xFFFF0000),
    600: Color(0xFFCC0000),
    700: Color(0xFF990000),
    800: Color(0xFF660000),
    900: Color(0xFF330000),
  };

  /// ✅ Éxito
  final Map<int, Color> success = const {
    25: Color(0xFFFBFFFA),
    50: Color(0xFFEBFFE5),
    100: Color(0xFFD6FFCC),
    200: Color(0xFFADFF99),
    300: Color(0xFF85FF66),
    400: Color(0xFF5CFF33),
    500: Color(0xFF29CC00),
    600: Color(0xFF29CC00),
    700: Color(0xFF1F9900),
    800: Color(0xFF146600),
    900: Color(0xFF0A3300),
  };

  /// ⚠️ Warning / Estados de prioridad media o indicador de mensaje nuevo
  final Map<int, Color> warning = const {
    25: Color(0xFFFCFCFD),
    50: Color(0xFFFDF6E3),
    100: Color(0xFFFDE7B2),
    200: Color(0xFFFCD46F),
    300: Color(0xFFFBC02D),
    400: Color(0xFFF9A825),
    500: Color(0xFFF57F17),
    600: Color(0xFFDAA520),
    700: Color(0xFF997000),
    800: Color(0xFF664B00),
    900: Color(0xFF332500),
  };
}
