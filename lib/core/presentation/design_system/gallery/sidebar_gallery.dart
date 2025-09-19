import "package:flutter/material.dart";
import "package:minds2_ui_v3/core/presentation/design_system/organisms/ds_side_menu.dart";

class SidebarGallery extends StatelessWidget {
  const SidebarGallery({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sidebar — Gallery")),
      body: const DSSideMenu(),
    );
  }
}
