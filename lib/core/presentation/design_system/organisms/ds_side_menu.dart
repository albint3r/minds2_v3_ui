import "package:flutter/material.dart";
import "package:minds2_ui_v3/core/presentation/design_system/molecules/ds_main_side_bar.dart";
import "package:minds2_ui_v3/core/presentation/design_system/molecules/ds_navigation_rail.dart";

class DSSideMenu extends StatefulWidget {
  const DSSideMenu({super.key});

  @override
  State<DSSideMenu> createState() => _DSSideMenuState();
}

class _DSSideMenuState extends State<DSSideMenu> {
  bool _isCollapsed = false;

  void _toggleMenu() {
    setState(() {
      _isCollapsed = !_isCollapsed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        DSProjectRail(onLogoTap: _toggleMenu), // Rail manda la señal
        if (!_isCollapsed) const DSMainSidebar(),
      ],
    );
  }
}
