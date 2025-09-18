import "package:flutter/material.dart";
import "package:minds2_ui_v3/core/presentation/design_system/molecules/ds_metric_card.dart";
import "package:minds2_ui_v3/core/presentation/design_system/tokens/spacing_tokens.dart";

class DSMetricCardGallery extends StatelessWidget {
  const DSMetricCardGallery({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("DS Metric Card — Gallery")),
      body: const Padding(
        padding: EdgeInsets.all(DSSpacing.lg),
        child: Column(
          children: [
            DSMetricCard(
              periodLabel: "Monthly",
              metricLabel: "Appt.",
              metricTooltip: "Appointments booked this month",
              deltaText: "+2.4%",
              deltaIsPositive: true,
              metricValue: "+45",
              valueTooltip: "Total appointments vs previous month",
              metricSubtitle: "Avg. Daily",
              caption: "You ear extra compared to last month.",
            ),
          ],
        ),
      ),
    );
  }
}
