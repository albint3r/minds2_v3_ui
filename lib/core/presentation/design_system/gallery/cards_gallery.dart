import "package:easy_localization/easy_localization.dart";
import "package:flutter/material.dart";
import "package:minds2_ui_v3/core/domain/deals_creation_entity_type.dart";
import "package:minds2_ui_v3/core/domain/deals_priority.dart";
import "package:minds2_ui_v3/core/presentation/design_system/atoms/ds_gap.dart";
import "package:minds2_ui_v3/core/presentation/design_system/molecules/ds_deal_card.dart";
import "package:minds2_ui_v3/core/presentation/design_system/molecules/ds_metric_card.dart";
import "package:minds2_ui_v3/core/presentation/design_system/tokens/spacing_tokens.dart";

class DSMetricCardGallery extends StatelessWidget {
  const DSMetricCardGallery({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("DS Metric Card — Gallery")),
      body: Padding(
        padding: const EdgeInsets.all(DSSpacing.lg),
        child: Column(
          children: [
            DSMetricCard(
              periodLabel: "tokens.monthly".tr(),
              metricLabel: "ds.appointments".tr(),
              metricTooltip: "Appointments booked this month",
              deltaText: "+2.4%",
              deltaIsPositive: true,
              metricValue: "+45",
              valueTooltip: "Total appointments vs previous month",
              metricSubtitle: "ds.avgDaily".tr(),
              caption: "ds.earnings.moreThanPrevious".tr(
                namedArgs: {"amount": "+45"},
              ),
            ),
            const DSGap.md(),
            DSDealCard(
              title: "Alofa - Nova Pro",
              ownerUrl: "https://picsum.photos/seed/u500/200",
              amount: 270000,
              closeDate: DateTime(2025, 12, 15),
              createDate: DateTime(2025, 12, 1),
              lastActionDate: DateTime(2025, 12, 1),
              priority: DealsPriority.high,
              creationEntityType: DealsCreationEntityType.ai,
              existMessage: false,
              haveWorkflows: false,
            ),
          ],
        ),
      ),
    );
  }
}
