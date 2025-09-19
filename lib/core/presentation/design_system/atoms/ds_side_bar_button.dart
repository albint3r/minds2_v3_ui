// lib/core/presentation/design_system/atoms/ds_sidebar_buttons.dart
import "package:flutter/material.dart";
import "package:minds2_ui_v3/core/presentation/design_system/atoms/ds_gap.dart";
import "package:minds2_ui_v3/core/presentation/design_system/atoms/ds_icon.dart";
import "package:minds2_ui_v3/core/presentation/design_system/atoms/ds_text.dart";
import "package:minds2_ui_v3/core/presentation/design_system/tokens/color_tokens.dart";

enum DSSidebarBtnState { normal, active, disabled }

// ─────────────────────────────────────────────────────────────────────────────
// BOTÓN “BOXED” (los de navegación: Home, Conversations, etc.)
// ─────────────────────────────────────────────────────────────────────────────
class DSSidebarBoxButton extends StatelessWidget {
  const DSSidebarBoxButton({
    super.key,
    required this.icon,
    required this.label,
    this.state = DSSidebarBtnState.normal,
    this.onTap,
  });

  final IconData icon;
  final String label;
  final DSSidebarBtnState state;
  final VoidCallback? onTap;

  bool get _isDisabled => state == DSSidebarBtnState.disabled;

  bool get _isActive => state == DSSidebarBtnState.active;

  @override
  Widget build(BuildContext context) {
    final bg = _isActive
        ? DSColors.secondary.table[400]! // caja activa
        : Colors.transparent;

    final textColor = _isDisabled
        ? DSColors.primary.ink[100]!
        : DSColors.primary.ink[25]!;

    final iconTone = _isDisabled
        ? DSIconTone.disabled
        : (_isActive ? DSIconTone.selected : DSIconTone.muted);

    return InkWell(
      onTap: _isDisabled ? null : onTap,
      borderRadius: BorderRadius.circular(8),
      hoverColor: DSColors.primary.ink[800],
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(color: bg),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const DSGap.xl(),
            DSIcon(icon, tone: _isActive ? DSIconTone.normal : iconTone),
            const DSGap.sm(),
            Expanded(
              child: DSText.labels(
                label,
                color: _isActive ? DSColors.primary.ink[900] : textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// BOTÓN DE TEXTO (los de abajo: Support / Log out)
// ─────────────────────────────────────────────────────────────────────────────
class DSSidebarTextButton extends StatelessWidget {
  const DSSidebarTextButton({
    super.key,
    required this.icon,
    required this.label,
    this.state = DSSidebarBtnState.normal,
    this.onTap,
  });

  final IconData icon;
  final String label;
  final DSSidebarBtnState state;
  final VoidCallback? onTap;

  bool get _isDisabled => state == DSSidebarBtnState.disabled;

  @override
  Widget build(BuildContext context) {
    final textColor = _isDisabled
        ? DSColors.primary.ink[100]!
        : DSColors.primary.ink[25]!;

    final iconTone = _isDisabled ? DSIconTone.disabled : DSIconTone.muted;

    return InkWell(
      onTap: _isDisabled ? null : onTap,
      hoverColor: DSColors.primary.ink[800],
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Row(
          children: [
            const DSGap.xl(),
            DSIcon(icon, tone: iconTone),
            const DSGap.sm(),
            Expanded(child: DSText.labels(label, color: textColor)),
          ],
        ),
      ),
    );
  }
}
