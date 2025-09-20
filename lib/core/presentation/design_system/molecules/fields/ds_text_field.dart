import "package:flutter/material.dart";
import "package:minds2_ui_v3/core/presentation/design_system/atoms/ds_text.dart";
import "package:minds2_ui_v3/core/presentation/design_system/tokens/spacing_tokens.dart";
import "package:reactive_forms/reactive_forms.dart";

class DSTextField extends StatelessWidget {
  const DSTextField({
    super.key,
    required this.label,
    required this.formControlName,
    this.width = 420,
  });

  final String label;
  final String formControlName;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: DSSpacing.md),
            child: DSText.labels(label),
          ),
          ReactiveTextField(formControlName: formControlName),
        ],
      ),
    );
  }
}
