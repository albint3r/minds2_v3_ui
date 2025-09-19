import "package:flutter/material.dart";
import "package:minds2_ui_v3/core/presentation/design_system/molecules/ds_navigation_rail.dart";

class SidebarGallery extends StatelessWidget {
  const SidebarGallery({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sidebar — Gallery")),
      body: const Row(
        children: [
          DSProjectRail(),
          // DSMainSidebar()
        ],
      ),
    );
  }
}
