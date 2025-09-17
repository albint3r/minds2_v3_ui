// lib/core/presentation/design_system/tokens/spacing_tokens.dart
import "package:flutter/material.dart";

/// Spacing scale (Design System) — basado en múltiplos de 4.
/// Siempre usa estos valores en vez de "magic numbers".
class DSSpacing {
  DSSpacing._();

  static const double xs  = 4;   // very tight
  static const double sm  = 8;   // small
  static const double md  = 16;  // default
  static const double lg  = 24;  // large
  static const double xl  = 32;  // extra large
  static const double xxl = 48;  // sections

  /// Acceso por lista (útil para iterar)
  static const values = [xs, sm, md, lg, xl, xxl];
}
