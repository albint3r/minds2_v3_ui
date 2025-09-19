// lib/core/presentation/design_system/molecules/ds_side_menu.dart
import "package:flutter/material.dart";
import "package:minds2_ui_v3/core/presentation/design_system/molecules/ds_main_side_bar.dart";
import "package:minds2_ui_v3/core/presentation/design_system/molecules/ds_navigation_rail.dart";

class DSSideMenu extends StatefulWidget {
  const DSSideMenu({super.key});

  @override
  State<DSSideMenu> createState() => _DSSideMenuState();
}

class _DSSideMenuState extends State<DSSideMenu> {
  static const double _sidebarWidth = 240;
  bool _isCollapsed = false;

  // selección de sección actual (tu “fuente de verdad” local)
  DSSection _current = DSSection.home;

  void _toggleMenu() => setState(() => _isCollapsed = !_isCollapsed);

  void _onSectionTap(DSSection s) {
    setState(() => _current = s); // marca activo
    // aquí disparas navegación/BLoC/lo que uses
    // print("Go -> $s");
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Rail SIEMPRE visible
        DSProjectRail(onLogoTap: _toggleMenu),

        // “slot” fijo de 240 px donde el sidebar vive
        SizedBox(
          width: _sidebarWidth,
          height: double.infinity,
          child: Stack(
            clipBehavior: Clip.hardEdge, // nada se dibuja fuera del slot
            children: [
              AnimatedPositioned(
                duration: const Duration(milliseconds: 380),
                curve: Curves.easeInOut,
                // cuando está colapsado, lo movemos completamente fuera a la izquierda
                left: _isCollapsed ? -_sidebarWidth : 0,
                top: 0,
                bottom: 0,
                width: _sidebarWidth,
                child: DSMainSidebar(
                  current: _current,
                  onSectionTap: _onSectionTap,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
