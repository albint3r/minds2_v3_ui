// lib/core/presentation/design_system/molecules/ds_main_sidebar.dart
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:minds2_ui_v3/auth/aplication/auth_bloc.dart";
import "package:minds2_ui_v3/core/presentation/design_system/atoms/ds_gap.dart";
import "package:minds2_ui_v3/core/presentation/design_system/atoms/ds_icon.dart";
import "package:minds2_ui_v3/core/presentation/design_system/atoms/ds_side_bar_button.dart";
import "package:minds2_ui_v3/core/presentation/design_system/tokens/color_tokens.dart";
import "package:minds2_ui_v3/gen/assets.gen.dart";

/// Secciones disponibles en el sidebar
enum DSSection {
  home,
  conversations,
  contacts,
  funnels,
  calendar,
  appointment,
  aiBuilder,
  integrations,
  team,
  billing,
  configuration,
  support,
  logout,
}

/// Barra principal (a la derecha del DSProjectRail).
/// - Ancho fijo 240px
/// - Fondo con degradado del DS
/// - Header/logo
/// - Arriba: botones “boxed”
/// - Abajo: botones de texto pegados al fondo
class DSMainSidebar extends StatelessWidget {
  const DSMainSidebar({
    super.key,
    this.width = 240,
    required this.current, // sección activa (para resaltar)
    this.onSectionTap, // notificación opcional al padre
  });

  final double width;
  final DSSection current;
  final ValueChanged<DSSection>? onSectionTap;

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
            children: [
              _item(
                section: DSSection.home,
                label: "Home",
                icon: const DSIcon.home(),
                active: current == DSSection.home,
                onTap: () {
                  // callback propio de este item
                  // aquí iría tu navegación/pantalla real
                  // por ahora solo imprime:
                  // ignore: avoid_print
                  print("[Sidebar] Home tapped");
                  onSectionTap?.call(DSSection.home);
                },
              ),
              _item(
                section: DSSection.conversations,
                label: "Conversations",
                icon: const DSIcon.conversation(),
                active: current == DSSection.conversations,
                onTap: () {
                  // ignore: avoid_print
                  print("[Sidebar] Conversations tapped");
                  onSectionTap?.call(DSSection.conversations);
                },
              ),
              _item(
                section: DSSection.contacts,
                label: "Contacts",
                icon: const DSIcon.contact(),
                active: current == DSSection.contacts,
                onTap: () {
                  // ignore: avoid_print
                  print("[Sidebar] Contacts tapped");
                  onSectionTap?.call(DSSection.contacts);
                },
              ),
              _item(
                section: DSSection.funnels,
                label: "Funnels",
                icon: const DSIcon.funnel(),
                active: current == DSSection.funnels,
                onTap: () {
                  // ignore: avoid_print
                  print("[Sidebar] Funnels tapped");
                  onSectionTap?.call(DSSection.funnels);
                },
              ),
              _item(
                section: DSSection.calendar,
                label: "Calendar",
                icon: const DSIcon.calendar(),
                active: current == DSSection.calendar,
                onTap: () {
                  // ignore: avoid_print
                  print("[Sidebar] Calendar tapped");
                  onSectionTap?.call(DSSection.calendar);
                },
              ),
              _item(
                section: DSSection.appointment,
                label: "Appointment",
                icon: const DSIcon.campaign(),
                active: current == DSSection.appointment,
                onTap: () {
                  // ignore: avoid_print
                  print("[Sidebar] Appointment tapped");
                  onSectionTap?.call(DSSection.appointment);
                },
              ),
              _item(
                section: DSSection.aiBuilder,
                label: "AI Builder",
                icon: const DSIcon.aiBuilder(),
                active: current == DSSection.aiBuilder,
                onTap: () {
                  // ignore: avoid_print
                  print("[Sidebar] AI Builder tapped");
                  onSectionTap?.call(DSSection.aiBuilder);
                },
              ),
              _item(
                section: DSSection.integrations,
                label: "Integrations",
                icon: const DSIcon.integrations(),
                active: current == DSSection.integrations,
                onTap: () {
                  // ignore: avoid_print
                  print("[Sidebar] Integrations tapped");
                  onSectionTap?.call(DSSection.integrations);
                },
              ),
              _item(
                section: DSSection.team,
                label: "Team",
                icon: const DSIcon.team(),
                active: current == DSSection.team,
                onTap: () {
                  // ignore: avoid_print
                  print("[Sidebar] Team tapped");
                  onSectionTap?.call(DSSection.team);
                },
              ),
              _item(
                section: DSSection.billing,
                label: "Billing",
                icon: const DSIcon.billing(),
                active: current == DSSection.billing,
                onTap: () {
                  // ignore: avoid_print
                  print("[Sidebar] Billing tapped");
                  onSectionTap?.call(DSSection.billing);
                },
              ),
              _item(
                section: DSSection.configuration,
                label: "Configuration",
                icon: const DSIcon.configuration(),
                active: current == DSSection.configuration,
                onTap: () {
                  // ignore: avoid_print
                  print("[Sidebar] Configuration tapped");
                  onSectionTap?.call(DSSection.configuration);
                },
              ),
            ],
          ),

          // ── Empuja el bloque inferior al fondo si hay espacio ──────────
          SliverFillRemaining(
            hasScrollBody: false,
            child: _BottomActions(
              onSupport: () {
                // ignore: avoid_print
                print("[Sidebar] Support tapped");
                onSectionTap?.call(DSSection.support);
              },
              onLogout: () {
                context.read<AuthBloc>().add(const AuthEvent.logOut());
                onSectionTap?.call(DSSection.logout);
              },
            ),
          ),
        ],
      ),
    );
  }

  /// Helper para construir cada ítem "boxed".
  Widget _item({
    required DSSection section,
    required String label,
    required DSIcon icon,
    required bool active,
    required VoidCallback onTap,
  }) {
    return DSSidebarBoxButton(
      icon: icon,
      label: label,
      state: active ? DSSidebarBtnState.active : DSSidebarBtnState.normal,
      onTap: onTap, // 👈 callback único por item
    );
  }
}

class _BottomActions extends StatelessWidget {
  const _BottomActions({required this.onSupport, required this.onLogout});

  final VoidCallback onSupport;
  final VoidCallback onLogout;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(), // dentro de SliverFillRemaining sí funciona
        DSSidebarTextButton(
          icon: const DSIcon.supportAgent(),
          label: "Support",
          onTap: onSupport,
        ),
        DSSidebarTextButton(
          icon: const DSIcon.logout(),
          label: "Log out",
          onTap: onLogout,
        ),
        const DSGap.xxl(),
      ],
    );
  }
}
