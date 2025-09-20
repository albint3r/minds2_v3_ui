import "package:flutter/material.dart";
import "package:minds2_ui_v3/core/presentation/design_system/organisms/ds_side_menu.dart";

class BodyHomeProject extends StatelessWidget {
  const BodyHomeProject({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(children: [DSSideMenu()]);
  }
}
