import "package:flutter/material.dart";
import "package:minds2_ui_v3/core/presentation/design_system/atoms/ds_button.dart";

class DSButtonGallery extends StatelessWidget {
  const DSButtonGallery({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("DS Button Gallery")),
      body: Center(
        child: Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            DSButton.primary(
              label: "Log in",
              onPressed: () {},
            ),
            DSButton.outline(
              label: "Log in",
              onPressed: () {},
            ),
            DSButton.dark(
              label: "Buy",
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
