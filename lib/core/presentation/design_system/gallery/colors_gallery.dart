import "package:flutter/material.dart";
import "package:minds2_ui_v3/core/presentation/design_system/tokens/color_tokens.dart";

/// Página simple para visualizar las rampas de color de tu DS.
/// - Usa DSColors.* en todo momento (también para textos).
/// - Muestra cada escala como una fila de “swatches” con el tono y su HEX.
class ColorsGallery extends StatelessWidget {
  const ColorsGallery({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Design System · Colors"),
        backgroundColor: cs.surface,
        foregroundColor: cs.onSurface,
        elevation: 0,
      ),
      backgroundColor: cs.surface,
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _Section(
            title: "Primary · brand (naranja)",
            child: _SwatchRow(map: DSColors.primary.brand),
          ),
          _Section(
            title: "Primary · ink (tipografía / seleccionados)",
            child: _SwatchRow(map: DSColors.primary.ink),
          ),
          const SizedBox(height: 8),
          _Section(
            title: "Secondary · gradient",
            child: _GradientPreview(colors: DSColors.secondary.gradient),
          ),
          _Section(
            title: "Secondary · table (azules)",
            child: _SwatchRow(map: DSColors.secondary.table),
          ),
          const SizedBox(height: 8),
          _Section(
            title: "Alert · error (rojos)",
            child: _SwatchRow(map: DSColors.alert.error),
          ),
          _Section(
            title: "Alert · success (verdes)",
            child: _SwatchRow(map: DSColors.alert.success),
          ),
          _Section(
            title: "Alert · warning (amarillos)",
            child: _SwatchRow(map: DSColors.alert.warning),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

/// Contenedor con título y cuerpo, usa tokens para bordes y superficies.
class _Section extends StatelessWidget {
  const _Section({required this.title, required this.child});
  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final surface = Theme.of(context).colorScheme.surface;
    final onSurface = Theme.of(context).colorScheme.onSurface;

    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: DSColors.primary.ink[100]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 10, 12, 6),
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: onSurface,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const Divider(height: 1, color: Color(0x1F000000)),
          // Body
          Padding(
            padding: const EdgeInsets.all(12),
            child: child,
          ),
        ],
      ),
    );
  }
}

/// Fila de “swatches” a partir de un Map<int, Color> (25..900).
class _SwatchRow extends StatelessWidget {
  const _SwatchRow({required this.map});
  final Map<int, Color> map;

  @override
  Widget build(BuildContext context) {
    final entries = map.entries.toList()
      ..sort((a, b) => a.key.compareTo(b.key));

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: entries
            .map((e) => _SwatchBox(tone: e.key, color: e.value))
            .toList(),
      ),
    );
  }
}

/// Caja individual de color con tono y HEX.
/// Usa DSColors.primary.ink[25]/[900] como texto según contraste.
class _SwatchBox extends StatelessWidget {
  const _SwatchBox({required this.tone, required this.color});
  final int tone;
  final Color color;

  @override
  Widget build(BuildContext context) {
    // Decidir color de texto usando los tokens del DS (nunca Colors.white/black)
    final useLightInk = color.computeLuminance() < 0.5;
    final textColor = useLightInk
        ? DSColors.primary.ink[25]!
        : DSColors.primary.ink[900]!;

    return Container(
      width: 96,
      height: 88,
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: DSColors.primary.ink[100]!),
      ),
      padding: const EdgeInsets.all(8),
      child: DefaultTextStyle(
        style: Theme.of(context).textTheme.labelSmall!.copyWith(
          color: textColor,
          fontWeight: FontWeight.w600,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("$tone"),
            const Spacer(),
            Text(_hex(color)),
          ],
        ),
      ),
    );
  }

  String _hex(Color c) {
    // #RRGGBB (descarta alpha)
    final r = c.red.toRadixString(16).padLeft(2, "0").toUpperCase();
    final g = c.green.toRadixString(16).padLeft(2, "0").toUpperCase();
    final b = c.blue.toRadixString(16).padLeft(2, "0").toUpperCase();
    return "#$r$g$b";
  }
}

/// Vista previa horizontal del gradiente secundario.
class _GradientPreview extends StatelessWidget {
  const _GradientPreview({required this.colors});
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: DSColors.primary.ink[100]!),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: colors,
        ),
      ),
    );
  }
}
