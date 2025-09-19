import "package:flutter/material.dart";

enum DSTextVariant {
  heading1,
  heading2,
  heading3,
  heading4,
  overline,
  navBar,
  filters,
  input,
  labels,
  tables,
  button,
  paragraph,
}

TextStyle _resolveStyle(BuildContext ctx, DSTextVariant v) {
  final t = Theme.of(ctx).textTheme;
  TextStyle _s(TextStyle? s) => s ?? t.bodyMedium ?? const TextStyle();

  switch (v) {
    case DSTextVariant.heading1:
      return _s(t.displayLarge);
    case DSTextVariant.heading2:
      return _s(t.displayMedium);
    case DSTextVariant.heading3:
      return _s(t.displaySmall);
    case DSTextVariant.heading4:
      return _s(t.headlineMedium);
    case DSTextVariant.overline:
      return _s(t.titleLarge);
    case DSTextVariant.navBar:
      return _s(t.titleMedium);
    case DSTextVariant.filters:
      return _s(t.titleSmall);
    case DSTextVariant.input:
      return _s(t.bodyLarge);
    case DSTextVariant.labels:
      return _s(t.bodyMedium);
    case DSTextVariant.tables:
      return _s(t.bodySmall);
    case DSTextVariant.button:
      return _s(t.labelLarge);
    case DSTextVariant.paragraph:
      return _s(t.labelSmall);
  }
}

class DSText extends StatelessWidget {
  const DSText(
      this.data, {
        super.key,
        required this.variant,
        this.color,
        this.textAlign,
        this.maxLines,
        this.overflow,
        this.decoration,
        this.oneLine = false,   // fuerza 1 línea + elipsis si true
        this.maxScaleFactor,    // clamp del escalado del sistema
      });

  // ────────────────── FACTORIES (todas exponen overflow/maxLines) ──────────────────
  factory DSText.tables(
      String data, {
        Key? key,
        Color? color,
        bool oneLine = false,
        double? maxScaleFactor,
        int? maxLines,
        TextOverflow? overflow,
      }) =>
      DSText(
        data,
        key: key,
        variant: DSTextVariant.tables,
        color: color,
        oneLine: oneLine,
        maxScaleFactor: maxScaleFactor,
        maxLines: maxLines,
        overflow: overflow,
      );

  factory DSText.heading1(
      String data, {
        Key? key,
        Color? color,
        bool oneLine = false,
        double? maxScaleFactor,
        int? maxLines,
        TextOverflow? overflow,
      }) =>
      DSText(
        data,
        key: key,
        variant: DSTextVariant.heading1,
        color: color,
        oneLine: oneLine,
        maxScaleFactor: maxScaleFactor,
        maxLines: maxLines,
        overflow: overflow,
      );

  factory DSText.heading2(
      String data, {
        Key? key,
        Color? color,
        bool oneLine = false,
        double? maxScaleFactor,
        int? maxLines,
        TextOverflow? overflow,
      }) =>
      DSText(
        data,
        key: key,
        variant: DSTextVariant.heading2,
        color: color,
        oneLine: oneLine,
        maxScaleFactor: maxScaleFactor,
        maxLines: maxLines,
        overflow: overflow,
      );

  factory DSText.heading3(
      String data, {
        Key? key,
        Color? color,
        bool oneLine = false,
        double? maxScaleFactor,
        int? maxLines,
        TextOverflow? overflow,
      }) =>
      DSText(
        data,
        key: key,
        variant: DSTextVariant.heading3,
        color: color,
        oneLine: oneLine,
        maxScaleFactor: maxScaleFactor,
        maxLines: maxLines,
        overflow: overflow,
      );

  factory DSText.heading4(
      String data, {
        Key? key,
        Color? color,
        bool oneLine = false,
        double? maxScaleFactor,
        int? maxLines,
        TextOverflow? overflow,
      }) =>
      DSText(
        data,
        key: key,
        variant: DSTextVariant.heading4,
        color: color,
        oneLine: oneLine,
        maxScaleFactor: maxScaleFactor,
        maxLines: maxLines,
        overflow: overflow,
      );

  factory DSText.overline(
      String data, {
        Key? key,
        Color? color,
        bool oneLine = false,
        double? maxScaleFactor,
        int? maxLines,
        TextOverflow? overflow,
      }) =>
      DSText(
        data,
        key: key,
        variant: DSTextVariant.overline,
        color: color,
        oneLine: oneLine,
        maxScaleFactor: maxScaleFactor,
        maxLines: maxLines,
        overflow: overflow,
      );

  factory DSText.navBar(
      String data, {
        Key? key,
        Color? color,
        bool oneLine = false,
        double? maxScaleFactor,
        int? maxLines,
        TextOverflow? overflow,
      }) =>
      DSText(
        data,
        key: key,
        variant: DSTextVariant.navBar,
        color: color,
        oneLine: oneLine,
        maxScaleFactor: maxScaleFactor,
        maxLines: maxLines,
        overflow: overflow,
      );

  factory DSText.filters(
      String data, {
        Key? key,
        Color? color,
        bool oneLine = false,
        double? maxScaleFactor,
        int? maxLines,
        TextOverflow? overflow,
      }) =>
      DSText(
        data,
        key: key,
        variant: DSTextVariant.filters,
        color: color,
        oneLine: oneLine,
        maxScaleFactor: maxScaleFactor,
        maxLines: maxLines,
        overflow: overflow,
      );

  factory DSText.input(
      String data, {
        Key? key,
        Color? color,
        bool oneLine = false,
        double? maxScaleFactor,
        int? maxLines,
        TextOverflow? overflow,
      }) =>
      DSText(
        data,
        key: key,
        variant: DSTextVariant.input,
        color: color,
        oneLine: oneLine,
        maxScaleFactor: maxScaleFactor,
        maxLines: maxLines,
        overflow: overflow,
      );

  factory DSText.labels(
      String data, {
        Key? key,
        Color? color,
        bool oneLine = false,
        double? maxScaleFactor,
        int? maxLines,
        TextOverflow? overflow,
      }) =>
      DSText(
        data,
        key: key,
        variant: DSTextVariant.labels,
        color: color,
        oneLine: oneLine,
        maxScaleFactor: maxScaleFactor,
        maxLines: maxLines,
        overflow: overflow,
      );

  /// Alias práctico para barras laterales (siempre 1 línea)
  factory DSText.labels1L(
      String data, {
        Key? key,
        Color? color,
        double? maxScaleFactor,
        int? maxLines,               // por consistencia, aunque 1 línea
        TextOverflow? overflow,      // idem (default ellipsis)
      }) =>
      DSText(
        data,
        key: key,
        variant: DSTextVariant.labels,
        color: color,
        oneLine: true,
        maxScaleFactor: maxScaleFactor,
        maxLines: maxLines,
        overflow: overflow,
      );

  /// Para botones dejamos 1 línea por defecto
  factory DSText.button(
      String data, {
        Key? key,
        Color? color,
        double? maxScaleFactor,
        int? maxLines,               // por consistencia, aunque 1 línea
        TextOverflow? overflow,      // idem
      }) =>
      DSText(
        data,
        key: key,
        variant: DSTextVariant.button,
        color: color,
        oneLine: true,
        maxScaleFactor: maxScaleFactor,
        maxLines: maxLines,
        overflow: overflow,
      );

  factory DSText.paragraph(
      String data, {
        Key? key,
        Color? color,
        bool oneLine = false,
        double? maxScaleFactor,
        int? maxLines,
        TextOverflow? overflow,
      }) =>
      DSText(
        data,
        key: key,
        variant: DSTextVariant.paragraph,
        color: color,
        oneLine: oneLine,
        maxScaleFactor: maxScaleFactor,
        maxLines: maxLines,
        overflow: overflow,
      );

  // ───────────────────────── CAMPOS ─────────────────────────
  final String data;
  final DSTextVariant variant;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextDecoration? decoration;

  final bool oneLine;
  final double? maxScaleFactor;

  @override
  Widget build(BuildContext context) {
    final base = _resolveStyle(context, variant);
    final cs = Theme.of(context).colorScheme;

    final effectiveMaxLines =
        maxLines ?? (oneLine || variant == DSTextVariant.button ? 1 : null);
    final effectiveOverflow =
        overflow ?? (oneLine || variant == DSTextVariant.button ? TextOverflow.ellipsis : null);
    final softWrap = oneLine ? false : null;

    final scaler = MediaQuery.textScalerOf(context);
    final clamped = (maxScaleFactor != null)
        ? scaler.clamp(maxScaleFactor: maxScaleFactor!)
        : scaler;

    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: clamped),
      child: Text(
        data,
        textAlign: textAlign,
        maxLines: effectiveMaxLines,
        overflow: effectiveOverflow,
        softWrap: softWrap,
        style: base.copyWith(
          color: color ?? cs.onSurface,
          decoration: decoration,
        ),
      ),
    );
  }
}
