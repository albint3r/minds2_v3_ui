// lib/core/presentation/design_system/gallery/typography_gallery.dart
import "package:flutter/material.dart";

class TypographyGallery extends StatelessWidget {
  const TypographyGallery({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    // Orden y nombres EXACTOS de Figma
    final rows = <_Spec>[
      _Spec("Heading 1", tt.displayLarge!, 47.78),
      _Spec("Heading 2", tt.displayMedium!, 39.81),
      _Spec("Heading 3", tt.displaySmall!, 33.18),
      _Spec("Heading 4", tt.headlineMedium!, 27.65),
      _Spec("Overline", tt.titleLarge!, 25.00),
      _Spec("Menú Nav Bar", tt.titleMedium!, 20.00),
      _Spec("Filtros", tt.titleSmall!, 19.00),
      _Spec("Imput...", tt.bodyLarge!, 16.00), // así como viene en tu captura
      _Spec("Labels", tt.bodyMedium!, 14.00),
      _Spec("Tablas", tt.bodySmall!, 14.00),
      _Spec("Botón", tt.labelLarge!, 14.00),
      _Spec("Paragraph", tt.labelSmall!, 10.00),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Design System · Typography"),
        backgroundColor: cs.surface,
        foregroundColor: cs.onSurface,
        elevation: 0,
      ),
      backgroundColor: cs.surface,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: _TypographyTable(rows: rows),
      ),
    );
  }
}

class _TypographyTable extends StatelessWidget {
  const _TypographyTable({required this.rows});

  final List<_Spec> rows;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(
        color: cs.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: cs.outlineVariant),
      ),
      child: DataTable(
        headingRowColor: WidgetStatePropertyAll(cs.surface),
        headingTextStyle: Theme.of(context).textTheme.labelMedium?.copyWith(
          color: cs.onSurface,
          fontWeight: FontWeight.w700,
          letterSpacing: .6,
        ),
        columns: const [
          DataColumn(label: Text("Name")),
          DataColumn(label: Text("Weight")),
          DataColumn(label: Text("PX")),
          DataColumn(label: Text("REM")),
        ],
        rows: rows.map((r) => r.toDataRow(context)).toList(),
      ),
    );
  }
}

class _Spec {
  _Spec(this.name, this.style, this.px);

  final String name;
  final TextStyle style;
  final double px;

  // Base web típica: 16 px = 1 rem
  String get rem => (px / 16.0)
      .toStringAsFixed(3)
      .replaceFirst(RegExp(r"0+$"), "")
      .replaceFirst(RegExp(r"\.$"), "");

  String get weightLabel {
    final w = style.fontWeight ?? FontWeight.w400;
    if (w.index >= FontWeight.w700.index) return "Bold";
    if (w.index >= FontWeight.w600.index) return "Semibold";
    if (w.index >= FontWeight.w500.index) return "Medium";
    if (w.index <= FontWeight.w300.index) return "Light";
    return "Regular";
  }

  DataRow toDataRow(BuildContext context) {
    final onSurface = Theme.of(context).colorScheme.onSurface;

    // Solo ajustar color; cualquier decoración (underline de Input…) ya viene en el token
    final sampleStyle = style.copyWith(color: onSurface);

    return DataRow(
      cells: [
        DataCell(Text(name, style: sampleStyle)),
        // muestra el texto con SU estilo
        DataCell(Text(weightLabel)),
        DataCell(Text(_px(px))),
        DataCell(Text("$rem rem")),
      ],
    );
  }

  static String _px(double v) {
    final s = v.toStringAsFixed(v % 1 == 0 ? 0 : 2);
    return "$s px";
  }
}
