import "package:flutter/material.dart";
import "package:minds2_ui_v3/core/presentation/design_system/components/ds_text.dart";

class TypographyGallery extends StatelessWidget {
  const TypographyGallery({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    // Orden y nombres en inglés (como Figma), usando VARIANT + PX
    final rows = <({String label, DSTextVariant variant, double px})>[
      (label: "Heading 1", variant: DSTextVariant.heading1, px: 47.78),
      (label: "Heading 2", variant: DSTextVariant.heading2, px: 39.81),
      (label: "Heading 3", variant: DSTextVariant.heading3, px: 33.18),
      (label: "Heading 4", variant: DSTextVariant.heading4, px: 27.65),
      (label: "Overline", variant: DSTextVariant.overline, px: 25.00),
      (label: "Nav Bar", variant: DSTextVariant.navBar, px: 20.00),
      (label: "Filters", variant: DSTextVariant.filters, px: 19.00),
      (label: "Input…", variant: DSTextVariant.input, px: 16.00),
      (label: "Labels", variant: DSTextVariant.labels, px: 14.00),
      (label: "Tables", variant: DSTextVariant.tables, px: 14.00),
      (label: "Button", variant: DSTextVariant.button, px: 14.00),
      (label: "Paragraph", variant: DSTextVariant.paragraph, px: 10.00),
    ];

    return Scaffold(
      appBar: AppBar(
        title: DSText.labels("Design System · Typography"),
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

  final List<({String label, DSTextVariant variant, double px})> rows;

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
        columns: [
          DataColumn(label: DSText.labels("Name")),
          DataColumn(label: DSText.labels("Weight")),
          DataColumn(label: DSText.labels("PX")),
          DataColumn(label: DSText.labels("REM")),
        ],
        rows: rows.map((r) => _toRow(context, r)).toList(),
      ),
    );
  }

  DataRow _toRow(
    BuildContext context,
    ({String label, DSTextVariant variant, double px}) spec,
  ) {
    final sample = spec.label; // mostramos el nombre con su propio estilo
    final onSurface = Theme.of(context).colorScheme.onSurface;

    // 1) Widget usando FACTORY de DSText (lo que querías)
    final widget = _buildDSText(sample, spec.variant, onSurface);

    // 2) Peso/estilo resuelto por variant (sin tocar .style del widget)
    final resolved = _resolveStyle(context, spec.variant);
    final weightLabel = _weightLabel(resolved.fontWeight ?? FontWeight.w400);

    // 3) REM a partir de PX
    final pxStr = _px(spec.px);
    final remStr = _rem(spec.px);

    return DataRow(
      cells: [
        DataCell(widget),
        DataCell(Text(weightLabel)),
        DataCell(Text(pxStr)),
        DataCell(Text(remStr)),
      ],
    );
  }

  // FACTORIES de DSText para cada variant
  Widget _buildDSText(String text, DSTextVariant v, Color color) {
    switch (v) {
      case DSTextVariant.heading1:
        return DSText.heading1(text, color: color);
      case DSTextVariant.heading2:
        return DSText.heading2(text, color: color);
      case DSTextVariant.heading3:
        return DSText.heading3(text, color: color);
      case DSTextVariant.heading4:
        return DSText.heading4(text, color: color);
      case DSTextVariant.overline:
        return DSText.overline(text, color: color);
      case DSTextVariant.navBar:
        return DSText.navBar(text, color: color);
      case DSTextVariant.filters:
        return DSText.filters(text, color: color);
      case DSTextVariant.input:
        return DSText.input(text, color: color);
      case DSTextVariant.labels:
        return DSText.labels(text, color: color);
      case DSTextVariant.tables:
        return DSText.tables(text, color: color);
      case DSTextVariant.button:
        return DSText.button(text, color: color);
      case DSTextVariant.paragraph:
        return DSText.paragraph(text, color: color);
    }
  }

  // Resolver TextStyle desde el Theme por variant (sin construir el widget)
  TextStyle _resolveStyle(BuildContext ctx, DSTextVariant v) {
    final t = Theme.of(ctx).textTheme;
    switch (v) {
      case DSTextVariant.heading1:
        return t.displayLarge!;
      case DSTextVariant.heading2:
        return t.displayMedium!;
      case DSTextVariant.heading3:
        return t.displaySmall!;
      case DSTextVariant.heading4:
        return t.headlineMedium!;
      case DSTextVariant.overline:
        return t.titleLarge!;
      case DSTextVariant.navBar:
        return t.titleMedium!;
      case DSTextVariant.filters:
        return t.titleSmall!;
      case DSTextVariant.input:
        return t.bodyLarge!;
      case DSTextVariant.labels:
        return t.bodyMedium!;
      case DSTextVariant.tables:
        return t.bodySmall!;
      case DSTextVariant.button:
        return t.labelLarge!;
      case DSTextVariant.paragraph:
        return t.labelSmall!;
    }
  }

  String _weightLabel(FontWeight w) {
    if (w.index >= FontWeight.w700.index) return "Bold";
    if (w.index >= FontWeight.w600.index) return "Semibold";
    if (w.index >= FontWeight.w500.index) return "Medium";
    if (w.index <= FontWeight.w300.index) return "Light";
    return "Regular";
  }

  String _px(double v) {
    final s = v.toStringAsFixed(v % 1 == 0 ? 0 : 2);
    return "$s px";
  }

  String _rem(double px) {
    final s = (px / 16.0)
        .toStringAsFixed(3)
        .replaceFirst(RegExp(r"0+$"), "")
        .replaceFirst(RegExp(r"\.$"), "");
    return "$s rem";
  }
}
