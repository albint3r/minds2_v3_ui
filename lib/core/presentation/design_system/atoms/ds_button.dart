import "package:flutter/material.dart";
import "package:minds2_ui_v3/core/presentation/design_system/atoms/ds_text.dart";
import "package:minds2_ui_v3/core/presentation/design_system/tokens/button_tokens.dart";

enum DSButtonVariant { primary, outline, dark }

class DSButton extends StatelessWidget {
  factory DSButton.primary({
    Key? key,
    required String label,
    VoidCallback? onPressed,
  }) => DSButton._(
    key: key,
    label: label,
    onPressed: onPressed,
    variant: DSButtonVariant.primary,
  );

  factory DSButton.outline({
    Key? key,
    required String label,
    VoidCallback? onPressed,
  }) => DSButton._(
    key: key,
    label: label,
    onPressed: onPressed,
    variant: DSButtonVariant.outline,
  );

  factory DSButton.dark({
    Key? key,
    required String label,
    VoidCallback? onPressed,
  }) => DSButton._(
    key: key,
    label: label,
    onPressed: onPressed,
    variant: DSButtonVariant.dark,
  );

  const DSButton._({
    super.key,
    required this.label,
    this.onPressed,
    required this.variant,
  });

  final String label;
  final VoidCallback? onPressed;
  final DSButtonVariant variant;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: _style,
      // ¡no forzamos color aquí!
      child: DSText.labels(label),
    );
  }

  // helpers
  T _byState<T>(
    Set<WidgetState> s, {
    required T enabled,
    required T disabled,
  }) => s.contains(WidgetState.disabled) ? disabled : enabled;

  ButtonStyle get _style {
    const minSize = Size(DSButtonTokens.minWidth, DSButtonTokens.minHeight);
    final shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(DSButtonTokens.radius),
    );

    switch (variant) {
      case DSButtonVariant.primary:
        return ButtonStyle(
          minimumSize: const WidgetStatePropertyAll(minSize),
          padding: WidgetStatePropertyAll(DSButtonTokens.padding),
          shape: WidgetStatePropertyAll(shape),
          backgroundColor: WidgetStateProperty.resolveWith(
            (s) => _byState<Color>(
              s,
              enabled: DSButtonTokens.primaryBg,
              disabled: DSButtonTokens.disable,
            ),
          ),
          foregroundColor: WidgetStateProperty.resolveWith(
            (s) => _byState<Color>(
              s,
              enabled: DSButtonTokens.primaryLabel,
              disabled: DSButtonTokens.disable,
            ),
          ),
          elevation: const WidgetStatePropertyAll(0),
          shadowColor: const WidgetStatePropertyAll(Colors.transparent),
        );

      case DSButtonVariant.outline:
        return ButtonStyle(
          minimumSize: const WidgetStatePropertyAll(minSize),
          padding: WidgetStatePropertyAll(DSButtonTokens.padding),
          shape: WidgetStatePropertyAll(shape),
          backgroundColor: const WidgetStatePropertyAll(Colors.transparent),
          foregroundColor: WidgetStateProperty.resolveWith(
            (s) => _byState<Color>(
              s,
              enabled: DSButtonTokens.outlineLabel,
              disabled: DSButtonTokens.disable,
            ),
          ),
          side: WidgetStateProperty.resolveWith(
            (s) => BorderSide(
              color: _byState<Color>(
                s,
                enabled: DSButtonTokens.outlineBorder,
                disabled: DSButtonTokens.disable,
              ),
              width: 1.5,
            ),
          ),
          elevation: const WidgetStatePropertyAll(0),
          shadowColor: const WidgetStatePropertyAll(Colors.transparent),
        );

      case DSButtonVariant.dark:
        return ButtonStyle(
          minimumSize: const WidgetStatePropertyAll(minSize),
          padding: WidgetStatePropertyAll(DSButtonTokens.padding),
          shape: WidgetStatePropertyAll(shape),
          backgroundColor: WidgetStateProperty.resolveWith(
            (s) => _byState<Color>(
              s,
              enabled: DSButtonTokens.darkBg,
              disabled: DSButtonTokens.disable,
            ),
          ),
          foregroundColor: WidgetStateProperty.resolveWith(
            (s) => _byState<Color>(
              s,
              enabled: DSButtonTokens.darkLabel,
              disabled: DSButtonTokens.disable,
            ),
          ),
          elevation: const WidgetStatePropertyAll(0),
          shadowColor: const WidgetStatePropertyAll(Colors.transparent),
        );
    }
  }
}
