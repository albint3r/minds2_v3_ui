// lib/core/presentation/design_system/molecules/ds_main_sidebar.dart
import "package:flutter/material.dart";
import "package:minds2_ui_v3/core/presentation/design_system/atoms/ds_gap.dart";
import "package:minds2_ui_v3/core/presentation/design_system/atoms/ds_icon.dart";
import "package:minds2_ui_v3/core/presentation/design_system/atoms/ds_side_bar_button.dart";
import "package:minds2_ui_v3/core/presentation/design_system/tokens/color_tokens.dart";
import "package:minds2_ui_v3/gen/assets.gen.dart";

/// Barra principal (a la derecha del DSProjectRail).
/// - Ancho fijo 240px (configurable)
/// - Fondo con degradado del DS
/// - Header “MindS2”
/// - Arriba: botones en caja (boxed)
/// - Abajo: botones de texto (Support / Log out)
class DSMainSidebar extends StatelessWidget {
  const DSMainSidebar({super.key, this.width = 240});

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: DSColors.secondary.gradient,
        ),
      ),
      child: Column(
        children: [
          const DSGap.xxl(),
          Assets.images.logo.minds2WhiteLogo.image(height: 45),
          const DSGap.md(),
          // ── Navegación (boxed) ────────────────────────────────────────────
          const DSSidebarBoxButton(
            icon: DSIcon.home(),
            label: "Home",
            state: DSSidebarBtnState.active,
            onTap: null, // vacío
          ),
          const DSSidebarBoxButton(
            icon: DSIcon.conversation(),
            label: "Conversations",
            onTap: null,
          ),
          const DSSidebarBoxButton(
            icon: DSIcon.contact(),
            label: "Contacts",
            onTap: null,
          ),
          const DSSidebarBoxButton(
            icon: DSIcon.funnel(),
            label: "Funnels",
            onTap: null,
          ),
          const DSSidebarBoxButton(
            icon: DSIcon.calendar(),
            label: "Calendar",
            onTap: null,
          ),
          const DSSidebarBoxButton(
            icon: DSIcon.campaign(),
            label: "Appointment",
            onTap: null,
          ),
          const DSSidebarBoxButton(
            icon: DSIcon.aiBuilder(),
            label: "AI Builder",
            onTap: null,
          ),
          const DSSidebarBoxButton(
            icon: DSIcon.integrations(),
            label: "Integrations",
            onTap: null,
          ),
          const DSSidebarBoxButton(
            icon: DSIcon.team(),
            label: "Team",
            onTap: null,
          ),
          const DSSidebarBoxButton(
            icon: DSIcon.billing(),
            label: "Billing",
            onTap: null,
          ),
          const DSSidebarBoxButton(
            icon: DSIcon.configuration(),
            label: "Configuration",
            onTap: null,
          ),
          const Spacer(),
          // ── Acciones (text buttons) ───────────────────────────────────────
          const DSSidebarTextButton(
            icon: DSIcon.supportAgent(), // o el que uses para soporte
            label: "Support",
            onTap: null,
          ),
          const DSSidebarTextButton(
            icon: DSIcon.logout(),
            label: "Log out",
            onTap: null,
          ),
          const DSGap.xxl(),
        ],
      ),
    );
  }
}
