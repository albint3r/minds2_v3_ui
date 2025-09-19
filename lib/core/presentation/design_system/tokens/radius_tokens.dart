/// Radius scale (Design System) — basado en un sistema simple.
/// Siempre usa estos valores en vez de "magic numbers".
class DSRadius {
  DSRadius._();

  static const double none = 0;     // sin borde redondeado
  static const double sm   = 4;     // esquinas pequeñas
  static const double md   = 8;     // esquinas medianas
  static const double lg   = 16;    // esquinas grandes
  static const double xl   = 20;    // usado en botones
  static const double pill = 9999;  // full rounded (ej. chips, tags)

  /// Acceso por lista (útil para iterar)
  static const values = [none, sm, md, lg, xl, pill];
}
