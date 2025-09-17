// lib/core/presentation/design_system/gallery/icons_gallery.dart
import "package:flutter/material.dart";
import "package:minds2_ui_v3/core/presentation/design_system/components/ds_gap.dart";
import "package:minds2_ui_v3/core/presentation/design_system/components/ds_icon.dart";
import "package:minds2_ui_v3/core/presentation/design_system/components/ds_text.dart";
import "package:minds2_ui_v3/core/presentation/design_system/tokens/icon_tokens.dart";

class IconsGallery extends StatelessWidget {
  const IconsGallery({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    final icons = <String, Widget>{
      "Home": const DSIcon.md(DSIcons.home),
      "Conversation": const DSIcon.md(DSIcons.conversation),
      "Contact": const DSIcon.md(DSIcons.contact),
      "Funnel": const DSIcon.md(DSIcons.funnel),
      "Calendar": const DSIcon.md(DSIcons.calendar),
      "Campaign": const DSIcon.md(DSIcons.campaign),
      "AI Builder": const DSIcon.md(DSIcons.aiBuilder),
      "Integrations": const DSIcon.md(DSIcons.integrations),
      "Team": const DSIcon.md(DSIcons.team),
      "Billing": const DSIcon.md(DSIcons.billing),
      "Integrations Apply": const DSIcon.md(DSIcons.integrationsApply),
      "Logout": const DSIcon.md(DSIcons.logout),
      "Add": const DSIcon.md(DSIcons.add),
      "Check": const DSIcon.md(DSIcons.check),
      "Approved": const DSIcon.md(DSIcons.approved),
      "Close": const DSIcon.md(DSIcons.close),
      "CheckBox Selected": const DSIcon.md(DSIcons.checkBoxSelected),
      "CheckBox": const DSIcon.md(DSIcons.checkBox),
      "Circular Avatar Num": const DSIcon.md(DSIcons.circularAvatarNumber),
      "Message": const DSIcon.md(DSIcons.message),
      "AI Bot": const DSIcon.md(DSIcons.aiBot),
      "Integration Workflow": const DSIcon.md(DSIcons.integrationWorkflow),
      "Notification": const DSIcon.md(DSIcons.notification),
      "Configuration": const DSIcon.md(DSIcons.configuration),
      "Search": const DSIcon.md(DSIcons.search),
      "Back": const DSIcon.md(DSIcons.back),
      "Next": const DSIcon.md(DSIcons.next),
      "Profile": const DSIcon.md(DSIcons.profile),
      "Add Rounded": const DSIcon.md(DSIcons.addRounded),
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
