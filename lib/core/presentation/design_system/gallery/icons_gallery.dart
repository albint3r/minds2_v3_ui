// lib/core/presentation/design_system/gallery/icons_gallery.dart
import "package:flutter/material.dart";
import "package:minds2_ui_v3/core/presentation/design_system/tokens/icon_tokens.dart";

class IconsGallery extends StatelessWidget {
  const IconsGallery({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    final icons = <String, IconData>{
      "Home": DSIcons.home,
      "Conversation": DSIcons.conversation,
      "Contact": DSIcons.contact,
      "Funnel": DSIcons.funnel,
      "Calendar": DSIcons.calendar,
      "Campaign": DSIcons.campaign,
      "AI Builder": DSIcons.aiBuilder,
      "Integrations": DSIcons.integrations,
      "Team": DSIcons.team,
      "Billing": DSIcons.billing,
      "Integrations Apply": DSIcons.integrationsApply,
      "Logout": DSIcons.logout,
      "Add": DSIcons.add,
      "Check": DSIcons.check,
      "Approved": DSIcons.approved,
      "Close": DSIcons.close,
      "CheckBox Selected": DSIcons.checkBoxSelected,
      "CheckBox": DSIcons.checkBox,
      "Circular Avatar Num": DSIcons.circularAvatarNumber,
      "Message": DSIcons.message,
      "AI Bot": DSIcons.aiBot,
      "Integration Workflow": DSIcons.integrationWorkflow,
      "Notification": DSIcons.notification,
      "Configuration": DSIcons.configuration,
      "Search": DSIcons.search,
      "Back": DSIcons.back,
      "Next": DSIcons.next,
      "Profile": DSIcons.profile,
      "Add Rounded": DSIcons.addRounded,
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text("Design System · Icons"),
        backgroundColor: cs.surface,
        foregroundColor: cs.onSurface,
        elevation: 0,
      ),
      backgroundColor: cs.surface,
      body: GridView.count(
        padding: const EdgeInsets.all(8),
        crossAxisCount: 25,
        mainAxisSpacing: 2,   // 🔹 más pegados verticalmente
        crossAxisSpacing: 2,  // 🔹 más pegados horizontalmente
        children: icons.entries.map((entry) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(entry.value, size: 28, color: cs.onSurface), // 🔹 un poco más pequeño
              const SizedBox(height: 2), // 🔹 menos espacio
              Text(
                entry.key,
                style: Theme.of(context).textTheme.labelSmall,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis, // 🔹 evita que se corte mal
                maxLines: 2, // 🔹 soporta nombres largos
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
