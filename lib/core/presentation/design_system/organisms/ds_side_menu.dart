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
  DSSection _current = DSSection.home; // <- fuente de verdad actual

  void _toggleMenu() => setState(() => _isCollapsed = !_isCollapsed);

  void _onSectionTap(DSSection s) {
    setState(() => _current = s); // 1) marca seleccionado
    // 2) dispara tu navegación/bloc/evento
    // context.read<NavBloc>().add(NavigateTo(s));
    // o go_router / auto_route / setState de tu layout... lo que uses
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        DSProjectRail(onLogoTap: _toggleMenu),

        AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
          width: _isCollapsed ? 0 : _sidebarWidth,
          child: ClipRect(
            child: SizedBox(
              width: _sidebarWidth,
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 400),
                layoutBuilder: (currentChild, previousChildren) => Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    ...previousChildren,
                    if (currentChild != null) currentChild,
                  ],
                ),
                transitionBuilder: (child, animation) {
                  final isEntering = child.key == const ValueKey("expanded");
                  final tween = Tween<Offset>(
                    begin: isEntering ? const Offset(-1, 0) : Offset.zero,
                    end: isEntering ? Offset.zero : const Offset(1, 0),
                  );
                  return SlideTransition(
                    position: tween.animate(
                      CurvedAnimation(
                        parent: animation,
                        curve: Curves.easeInOut,
                      ),
                    ),
                    child: child,
                  );
                },
                child: _isCollapsed
                    ? const SizedBox.shrink(key: ValueKey("collapsed"))
                    : DSMainSidebar(
                        key: const ValueKey("expanded"),
                        current: _current,
                        onSectionTap: _onSectionTap,
                      ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
