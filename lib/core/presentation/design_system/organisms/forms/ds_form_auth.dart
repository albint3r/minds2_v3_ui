import "package:flutter/material.dart";
import "package:minds2_ui_v3/core/presentation/design_system/atoms/ds_text.dart";
import "package:minds2_ui_v3/core/presentation/design_system/tokens/spacing_tokens.dart";
import "package:reactive_forms/reactive_forms.dart";

class DSFormAuth extends StatelessWidget {
  const DSFormAuth({super.key, required this.formGroup, required this.fields});

  final FormGroup formGroup;
  final List<Widget> fields;

  @override
  Widget build(BuildContext context) {
    return ReactiveForm(
      formGroup: formGroup,
      child: Padding(
        padding: const EdgeInsets.all(DSSpacing.xxl),
        child: Column(
          spacing: DSSpacing.xl,
          children: [DSText.heading4("LogIn"), ...fields],
        ),
      ),
    );
  }
}
