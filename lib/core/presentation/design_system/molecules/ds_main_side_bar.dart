// lib/core/presentation/design_system/molecules/ds_main_sidebar.dart
import "package:flutter/material.dart";
import "package:minds2_ui_v3/core/presentation/design_system/atoms/ds_gap.dart";
import "package:minds2_ui_v3/core/presentation/design_system/atoms/ds_icon.dart";
import "package:minds2_ui_v3/core/presentation/design_system/atoms/ds_side_bar_button.dart";
import "package:minds2_ui_v3/core/presentation/design_system/tokens/color_tokens.dart";
import "package:minds2_ui_v3/gen/assets.gen.dart";

/// Barra principal (a la derecha del DSProjectRail).
/// - Ancho fijo 240px
/// - Fondo con degradado del DS
/// - Header/logo
/// - Arriba: botones “boxed”
/// - Abajo: botones de texto pegados al fondo
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
      child: CustomScrollView(
        slivers: [
          // ── Header/logo ────────────────────────────────────────────────
          SliverToBoxAdapter(
            child: Column(
              children: [
                const DSGap.xxl(),
                Assets.images.logo.minds2WhiteLogo.image(height: 45),
                const DSGap.md(),
              ],
            ),
          ),

          // ── Navegación (boxed) ─────────────────────────────────────────
          SliverList.list(
            children: const [
              DSSidebarBoxButton(
                icon: DSIcon.home(),
                label: "Home",
                state: DSSidebarBtnState.active,
                onTap: null,
              ),
              DSSidebarBoxButton(
                icon: DSIcon.conversation(),
                label: "Conversations",
                onTap: null,
              ),
              DSSidebarBoxButton(
                icon: DSIcon.contact(),
                label: "Contacts",
                onTap: null,
              ),
              DSSidebarBoxButton(
                icon: DSIcon.funnel(),
                label: "Funnels",
                onTap: null,
              ),
              DSSidebarBoxButton(
                icon: DSIcon.calendar(),
                label: "Calendar",
                onTap: null,
              ),
              DSSidebarBoxButton(
                icon: DSIcon.campaign(),
                label: "Appointment",
                onTap: null,
              ),
              DSSidebarBoxButton(
                icon: DSIcon.aiBuilder(),
                label: "AI Builder",
                onTap: null,
              ),
              DSSidebarBoxButton(
                icon: DSIcon.integrations(),
                label: "Integrations",
                onTap: null,
              ),
              DSSidebarBoxButton(
                icon: DSIcon.team(),
                label: "Team",
                onTap: null,
              ),
              DSSidebarBoxButton(
                icon: DSIcon.billing(),
                label: "Billing",
                onTap: null,
              ),
              DSSidebarBoxButton(
                icon: DSIcon.configuration(),
                label: "Configuration",
                onTap: null,
              ),
            ],
          ),

          // ── Empuja el bloque inferior al fondo si hay espacio ──────────
          const SliverFillRemaining(
            hasScrollBody: false,
            child: _BottomActions(),
          ),
        ],
      ),
    );
  }
}

class _BottomActions extends StatelessWidget {
  const _BottomActions();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Spacer(), // dentro de SliverFillRemaining sí funciona
        DSSidebarTextButton(
          icon: DSIcon.supportAgent(),
          label: "Support",
          onTap: null,
        ),
        DSSidebarTextButton(
          icon: DSIcon.logout(),
          label: "Log out",
          onTap: null,
        ),
        DSGap.xxl(),
      ],
    );
  }
}
