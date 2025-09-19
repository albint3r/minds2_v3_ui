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
  static const double _railWidth = 64;
  static const double _sidebarWidth = 240;

  bool _isCollapsed = false;

  void _toggleMenu() => setState(() => _isCollapsed = !_isCollapsed);

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Stack(
        children: [
          // ───────── Sidebar (debajo del rail) ─────────
          // Ocupa su caja a la derecha del rail y se desliza dentro de ella.
          Positioned(
            left: _railWidth,
            top: 0,
            bottom: 0,
            width: _sidebarWidth,
            child: ClipRect(
              child: IgnorePointer(
                ignoring: _isCollapsed, // no clics cuando está oculto
                child: AnimatedOpacity(
                  opacity: _isCollapsed ? 0.0 : 1.0,
                  duration: const Duration(milliseconds: 150),
                  curve: Curves.easeOut,
                  child: AnimatedSlide(
                    // Entra desde la IZQUIERDA (-1→0). Sale hacia la IZQUIERDA (0→-1).
                    offset: _isCollapsed ? const Offset(-1, 0) : Offset.zero,
                    duration: const Duration(milliseconds: 350),
                    curve: Curves.easeInOut,
                    child: const DSMainSidebar(width: _sidebarWidth),
                  ),
                ),
              ),
            ),
          ),

          // ───────── Rail (encima) ─────────
          // Siempre visible, encima del sidebar.
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            width: _railWidth,
            child: DSProjectRail(onLogoTap: _toggleMenu),
          ),
        ],
      ),
    );
  }
}
