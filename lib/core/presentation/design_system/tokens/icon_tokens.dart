// lib/core/presentation/design_system/tokens/icon_tokens.dart
import "package:flutter/material.dart";
import "package:minds2_ui_v3/core/presentation/design_system/tokens/color_tokens.dart";

class DSIcons {
  DSIcons._();

  // Home / navegación
  static const IconData home = Icons.home_rounded;
  static const IconData conversation = Icons.chat_outlined;

  // Usuario
  static const IconData contact = Icons.person_rounded;
  static const IconData funnel = Icons.filter_alt;
  static const IconData calendar = Icons.calendar_today_outlined;
  static const IconData campaign = Icons.campaign_outlined;
  static const IconData aiBuilder = Icons.memory_outlined;
  static const IconData integrations = Icons.device_hub_outlined;
  static const IconData team = Icons.group_outlined;
  static const IconData billing = Icons.attach_money_outlined;
  static const IconData integrationsApply = Icons.hub_outlined;
  static const IconData logout = Icons.exit_to_app_outlined;

  // Acciones
  static const IconData add = Icons.add_outlined;
  static const IconData check = Icons.check_outlined;
  static const IconData approved = Icons.check_circle_outlined;
  static const IconData close = Icons.close_outlined;
  static const IconData checkBoxSelected = Icons.check_box_outlined;
  static const IconData checkBox = Icons.check_box_outline_blank_outlined;
  static const IconData circularAvatarNumber = Icons.circle_outlined;

  // Mensajes / bots
  static const IconData message = Icons.mail_outline_outlined;
  static const IconData aiBot = Icons.smart_toy_outlined;
  static const IconData integrationWorkflow = Icons.merge_outlined;
  static const IconData notification = Icons.notifications_outlined;

  // Sistema
  static const IconData configuration = Icons.settings_outlined;
  static const IconData search = Icons.search_outlined;
  static const IconData back = Icons.arrow_back_ios_new_outlined;
  static const IconData next = Icons.arrow_forward_ios_outlined;
  static const IconData profile = Icons.account_circle_outlined;
  static const IconData addRounded = Icons.add_circle_outline;
}

class DSIconSize {
  DSIconSize._();

  static const double xs = 12;
  static const double sm = 16;
  static const double md = 20;
  static const double lg = 24;
  static const double xl = 32;
  static const double xxl = 49;
}

/// Colores por estado (solo tokens del DS)
class DSIconColors {
  DSIconColors._();

  static Color normal(ColorScheme cs) => cs.onSurface;

  static Color surface(ColorScheme cs) => cs.surface;

  static Color disabled(ColorScheme cs) => cs.onSurface.withValues(alpha: .38);

  static Color selected(ColorScheme cs) => cs.primary;

  static Color warning(ColorScheme cs) => DSColors.alert.warning[500]!;

  static Color error(ColorScheme cs) => cs.error;

  static Color containerSoft(ColorScheme cs) => cs.surfaceContainerHighest;

  static Color containerStrong(ColorScheme cs) =>
      DSColors.secondary.table[500]!;
}
