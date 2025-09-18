import "package:easy_localization/easy_localization.dart";
import "package:flutter/material.dart";
import "package:minds2_ui_v3/core/domain/deals_creation_entity_type.dart";
import "package:minds2_ui_v3/core/domain/deals_priority.dart";
import "package:minds2_ui_v3/core/presentation/design_system/atoms/ds_card.dart";
import "package:minds2_ui_v3/core/presentation/design_system/atoms/ds_gap.dart";
import "package:minds2_ui_v3/core/presentation/design_system/atoms/ds_icon.dart";
import "package:minds2_ui_v3/core/presentation/design_system/atoms/ds_profile_avatar.dart";
import "package:minds2_ui_v3/core/presentation/design_system/atoms/ds_text.dart";
import "package:minds2_ui_v3/core/presentation/design_system/molecules/ds_avatar_stack.dart";
import "package:minds2_ui_v3/core/presentation/design_system/tokens/color_tokens.dart";
import "package:minds2_ui_v3/core/presentation/design_system/tokens/icon_tokens.dart";
import "package:minds2_ui_v3/core/presentation/design_system/tokens/radius_tokens.dart";

class DSDealCard extends StatelessWidget {
  const DSDealCard({
    super.key,
    required this.title,
    required this.ownerUrl,
    required this.amount,
    required this.createDate,
    required this.closeDate,
    required this.lastActionDate,
    required this.priority,
    required this.existMessage,
    required this.haveWorkflows,
    required this.creationEntityType,
  });

  final String title;
  final String ownerUrl;
  final double amount;
  final DateTime createDate;
  final DateTime closeDate;
  final DateTime lastActionDate;
  final DealsPriority priority;
  final bool existMessage;
  final bool haveWorkflows;
  final DealsCreationEntityType creationEntityType;

  @override
  Widget build(BuildContext context) {
    final green = DSColors.alert.success[500]!;

    // final closeDateStr =
    //     "Close Date: ${closeDate.day}/ ${closeDate.month}/ ${closeDate.year}";
    // final createDateStr =
    //     "Create Date: ${createDate.day}/ ${createDate.month}/ ${createDate.year}";
    return DSCard(
      child: Column(
        children: [
          DSText.labels(title),
          const DSGap.md(),
          Row(
            children: [
              _LeftData(
                amount: amount,
                closeDate: closeDate,
                existMessage: existMessage,
              ),
              const Spacer(),
              _RightData(
                ownerUrl: ownerUrl,
                creationEntityType: creationEntityType,
                haveWorkflows: haveWorkflows,
              ),
            ],
          ),
          const DSGap.sm(),
          const Divider(height: 1),
          const DSGap.sm(),
          _BindContactAndLastActivity(lastActionDate: lastActionDate),
          const DSGap.sm(),
          _PriorityBar(createDate: createDate, green: green),
        ],
      ),
    );
  }
}

class _LeftData extends StatelessWidget {
  const _LeftData({
    required this.amount,
    required this.closeDate,
    required this.existMessage,
  });

  final double amount;
  final DateTime closeDate;
  final bool existMessage;

  @override
  Widget build(BuildContext context) {
    final green = DSColors.alert.success[500]!;

    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DSIcon.md(
            DSIcons.message,
            tone: existMessage ? DSIconTone.warning : DSIconTone.disabled,
          ),
          Row(
            children: [
              DSText.filters(
                "ds.amount".tr(args: [amount.toString()]),
                color: green,
              ),
            ],
          ),
          DSText.labels(
            "ds.closeDate".tr(
              args: ["${closeDate.day}-${closeDate.month}-${closeDate.year}"],
            ),
          ),
        ],
      ),
    );
  }
}

class _RightData extends StatelessWidget {
  const _RightData({
    required this.ownerUrl,
    required this.haveWorkflows,
    required this.creationEntityType,
  });

  final String ownerUrl;
  final bool haveWorkflows;
  final DealsCreationEntityType creationEntityType;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          DSProfileAvatar(imageUrl: ownerUrl),
          const DSGap.sm(),
          Row(
            children: [
              // Depende del quien creo el deal muestro los iconos
              switch (creationEntityType) {
                DealsCreationEntityType.human => const DSIcon(
                  DSIcons.profile,
                  tone: DSIconTone.disabled,
                ),
                DealsCreationEntityType.ai => const DSIcon(
                  DSIcons.aiBot,
                  tone: DSIconTone.disabled,
                ),
                DealsCreationEntityType.system => const DSIcon(
                  DSIcons.aiBot,
                  tone: DSIconTone.disabled,
                ),
              },
              // SI cuenta con un workflow muestra el icono.
              if (haveWorkflows)
                const DSIcon(
                  DSIcons.integrationWorkflow,
                  tone: DSIconTone.disabled,
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class _PriorityBar extends StatelessWidget {
  const _PriorityBar({required this.createDate, required this.green});

  final DateTime createDate;
  final Color green;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        DSText.paragraph(
          "ds.createDate".tr(
            args: ["${createDate.day}-${createDate.month}-${createDate.year}"],
          ),
        ),
        const DSGap.sm(),
        Expanded(
          child: Container(
            height: 3,
            decoration: BoxDecoration(
              color: green,
              borderRadius: const BorderRadius.all(
                Radius.circular(DSRadius.sm),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _BindContactAndLastActivity extends StatelessWidget {
  const _BindContactAndLastActivity({required this.lastActionDate});

  final DateTime lastActionDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            DSText.paragraph(
              "ds.lastActionDate".tr(
                args: [
                  "${lastActionDate.day}-${lastActionDate.month}-${lastActionDate.year}",
                ],
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            DSAvatarStack(
              items: const [
                "María López",
                "https://picsum.photos/seed/u1/200",
                "Carlos Díaz",
                "https://picsum.photos/seed/u2/200",
                "Ana",
              ],
              size: 30,
              overlapFraction: .4,
              maxVisible: 4,
              onTap: (index, src) {
                // navega al perfil según 'src'
              },
            ),
          ],
        ),
      ],
    );
  }
}
