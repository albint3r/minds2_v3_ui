// lib/core/presentation/design_system/gallery/icons_gallery.dart
import "package:flutter/material.dart";
import "package:minds2_ui_v3/core/presentation/design_system/atoms/ds_gap.dart";
import "package:minds2_ui_v3/core/presentation/design_system/atoms/ds_icon.dart";
import "package:minds2_ui_v3/core/presentation/design_system/atoms/ds_text.dart";

class IconsGallery extends StatelessWidget {
  const IconsGallery({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    final icons = <String, Widget>{
      "Home": const DSIcon.home(),
      "Conversation": const DSIcon.conversation(),
      "Contact": const DSIcon.contact(),
      "Funnel": const DSIcon.funnel(),
      "Calendar": const DSIcon.calendar(),
      "Campaign": const DSIcon.campaign(),
      "AI Builder": const DSIcon.aiBuilder(),
      "Integrations": const DSIcon.integrations(),
      "Team": const DSIcon.team(),
      "Billing": const DSIcon.billing(),
      "Integrations Apply": const DSIcon.integrationsApply(),
      "Logout": const DSIcon.logout(),
      "Add": const DSIcon.add(),
      "Check": const DSIcon.check(),
      "Approved": const DSIcon.approved(),
      "Close": const DSIcon.close(),
      "CheckBox Selected": const DSIcon.checkBoxSelected(),
      "CheckBox": const DSIcon.checkBox(),
      "Circular Avatar Num": const DSIcon.circularAvatarNumber(),
      "Message": const DSIcon.message(),
      "AI Bot": const DSIcon.aiBot(),
      "Integration Workflow": const DSIcon.integrationWorkflow(),
      "Notification": const DSIcon.notification(),
      "Configuration": const DSIcon.configuration(),
      "Search": const DSIcon.search(),
      "Back": const DSIcon.back(),
      "Next": const DSIcon.next(),
      "Profile": const DSIcon.profile(),
      "Add Rounded": const DSIcon.addRounded(),
    };

    return Scaffold(
      appBar: AppBar(
        title: DSText.labels("Design System · Icons"),
        backgroundColor: cs.surface,
        foregroundColor: cs.onSurface,
        elevation: 0,
      ),
      backgroundColor: cs.surface,
      body: GridView.count(
        padding: const EdgeInsets.all(8),
        crossAxisCount: 12,
        mainAxisSpacing: 2,
        crossAxisSpacing: 2,
        children: icons.entries.map((entry) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              entry.value, // DSIcon.md()
              const DSGap.sm(),
              DSText.paragraph(entry.key),
            ],
          );
        }).toList(),
      ),
    );
  }
}
