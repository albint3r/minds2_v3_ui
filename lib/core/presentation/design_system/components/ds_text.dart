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
  });
  factory DSText.tables(String data, {Key? key, Color? color}) =>
      DSText(data, key: key, variant: DSTextVariant.tables, color: color);

  // --- Factories ---
  factory DSText.heading1(String data, {Key? key, Color? color}) =>
      DSText(data, key: key, variant: DSTextVariant.heading1, color: color);

  factory DSText.heading2(String data, {Key? key, Color? color}) =>
      DSText(data, key: key, variant: DSTextVariant.heading2, color: color);

  factory DSText.heading3(String data, {Key? key, Color? color}) =>
      DSText(data, key: key, variant: DSTextVariant.heading3, color: color);

  factory DSText.heading4(String data, {Key? key, Color? color}) =>
      DSText(data, key: key, variant: DSTextVariant.heading4, color: color);

  factory DSText.overline(String data, {Key? key, Color? color}) =>
      DSText(data, key: key, variant: DSTextVariant.overline, color: color);

  factory DSText.navBar(String data, {Key? key, Color? color}) =>
      DSText(data, key: key, variant: DSTextVariant.navBar, color: color);

  factory DSText.filters(String data, {Key? key, Color? color}) =>
      DSText(data, key: key, variant: DSTextVariant.filters, color: color);

  factory DSText.input(String data, {Key? key, Color? color}) =>
      DSText(data, key: key, variant: DSTextVariant.input, color: color);

  factory DSText.labels(String data, {Key? key, Color? color}) =>
      DSText(data, key: key, variant: DSTextVariant.labels, color: color);

  factory DSText.button(String data, {Key? key, Color? color}) =>
      DSText(data, key: key, variant: DSTextVariant.button, color: color);

  factory DSText.paragraph(String data, {Key? key, Color? color}) =>
      DSText(data, key: key, variant: DSTextVariant.paragraph, color: color);

  final String data;
  final DSTextVariant variant;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextDecoration? decoration;

  @override
  Widget build(BuildContext context) {
    final base = _resolveStyle(context, variant);
    final cs = Theme.of(context).colorScheme;

    return Text(
      data,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: base.copyWith(
        color: color ?? cs.onSurface,
        decoration: decoration,
      ),
    );
  }
}

