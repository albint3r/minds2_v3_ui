extension NumCommasExtension on num {
  /// Convierte el número a String con separadores de miles por comas.
  /// - [decimalDigits]: fija la cantidad de decimales (null = deja los existentes).
  String toCommaString({int? decimalDigits}) {
    // 1) String base (con o sin decimales fijos)
    final s = (decimalDigits == null)
        ? toString()
        : toStringAsFixed(decimalDigits);

    // 2) Manejar signo
    final negative = s.startsWith("-");
    final unsigned = negative ? s.substring(1) : s;

    // 3) Separar parte entera y fracción
    final parts = unsigned.split(".");
    final intPart = parts[0];
    final fracPart = parts.length > 1 ? parts[1] : null;

    // 4) Insertar comas en la parte entera (de derecha a izquierda)
    final buf = StringBuffer();
    int count = 0;
    for (int i = intPart.length - 1; i >= 0; i--) {
      buf.write(intPart[i]);
      count++;
      if (count % 3 == 0 && i != 0) {
        buf.write(",");
      }
    }
    final intWithCommas = buf.toString().split("").reversed.join();

    // 5) Reconstruir
    final result = fracPart == null
        ? intWithCommas
        : "$intWithCommas.$fracPart";
    return negative ? "-$result" : result;
  }
}
