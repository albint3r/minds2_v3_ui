import "package:flutter/material.dart";
import "package:minds2_ui_v3/core/presentation/design_system/tokens/button_tokens.dart";

enum DSButtonVariant { primary, outline, dark }

class DSButton extends StatelessWidget {
  // 🔹 Factorys para facilidad
  factory DSButton.primary({
    Key? key,
    required String label,
    required VoidCallback onPressed,
  }) {
    return DSButton._(
      key: key,
      label: label,
      onPressed: onPressed,
      variant: DSButtonVariant.primary,
    );
  }

  factory DSButton.outline({
    Key? key,
    required String label,
    required VoidCallback onPressed,
  }) {
    return DSButton._(
      key: key,
      label: label,
      onPressed: onPressed,
      variant: DSButtonVariant.outline,
    );
  }

  factory DSButton.dark({
    Key? key,
    required String label,
    required VoidCallback onPressed,
  }) {
    return DSButton._(
      key: key,
      label: label,
      onPressed: onPressed,
      variant: DSButtonVariant.dark,
    );
  }

  const DSButton._({
    super.key,
    required this.label,
    required this.onPressed,
    required this.variant,
  });

  final String label;
  final VoidCallback onPressed;
  final DSButtonVariant variant;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: _style,
      child: Text(
        label,
        style: DSButtonTokens.label.copyWith(color: _textColor),
      ),
    );
  }

  // 🔹 Estilos por variante (siempre ElevatedButton)
  ButtonStyle get _style {
    switch (variant) {
      case DSButtonVariant.primary:
        return ElevatedButton.styleFrom(
          backgroundColor: DSButtonTokens.primaryBg,
          padding: DSButtonTokens.padding,
          minimumSize: const Size(DSButtonTokens.minWidth, 0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(DSButtonTokens.radius),
          ),
        );
      case DSButtonVariant.outline:
        return ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: DSButtonTokens.outlineLabel,
          side: BorderSide(color: DSButtonTokens.outlineBorder, width: 1.5),
          padding: DSButtonTokens.padding,
          minimumSize: const Size(DSButtonTokens.minWidth, 0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(DSButtonTokens.radius),
          ),
          elevation: 0,
          // para mantener el estilo plano
          shadowColor: Colors.transparent,
        );
      case DSButtonVariant.dark:
        return ElevatedButton.styleFrom(
          backgroundColor: DSButtonTokens.darkBg,
          padding: DSButtonTokens.padding,
          minimumSize: const Size(DSButtonTokens.minWidth, 0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(DSButtonTokens.radius),
          ),
        );
    }
  }

  // 🔹 Color de texto según variante
  Color get _textColor {
    switch (variant) {
      case DSButtonVariant.primary:
        return DSButtonTokens.primaryLabel;
      case DSButtonVariant.outline:
        return DSButtonTokens.outlineLabel;
      case DSButtonVariant.dark:
        return DSButtonTokens.darkLabel;
    }
  }
}
