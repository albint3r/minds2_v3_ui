import "package:flutter/material.dart";
import "package:minds2_ui_v3/core/presentation/design_system/atoms/ds_card.dart";
import "package:minds2_ui_v3/core/presentation/design_system/atoms/ds_gap.dart";
import "package:minds2_ui_v3/core/presentation/design_system/atoms/ds_icon.dart";
import "package:minds2_ui_v3/core/presentation/design_system/atoms/ds_text.dart";
import "package:minds2_ui_v3/core/presentation/design_system/tokens/color_tokens.dart";

class DSMetricCard extends StatelessWidget {
  const DSMetricCard({
    super.key,
    required this.periodLabel,
    required this.metricLabel,
    required this.metricValue,
    required this.metricSubtitle,
    this.deltaText,
    this.deltaIsPositive = true,
    this.caption,
    this.metricTooltip,
    this.valueTooltip,
  });

  final String periodLabel;
  final String metricLabel;
  final String metricValue;
  final String metricSubtitle;
  final String? deltaText;
  final bool deltaIsPositive;
  final String? caption;

  /// Tooltip que aparece sobre el label de la métrica
  final String? metricTooltip;

  /// Tooltip que aparece sobre el valor de la métrica
  final String? valueTooltip;

  @override
  Widget build(BuildContext context) {
    final success = DSColors.alert.success[500]!;
    final error = DSColors.alert.error[500]!;

    return DSCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Periodo con caret
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              DSText.filters(periodLabel),
              const DSGap.xs(),
              const DSIcon.sm(Icons.arrow_drop_down, tone: DSIconTone.muted),
            ],
          ),
          const DSGap.md(),

          // Métrica
          Row(
            children: [
              // Izquierda
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    metricTooltip != null
                        ? Tooltip(
                            message: metricTooltip!,
                            child: DSText.heading3(metricLabel),
                          )
                        : DSText.heading3(metricLabel),
                    if (deltaText != null) ...[
                      const DSGap.xs(),
                      DSText.labels(
                        deltaText!,
                        color: deltaIsPositive ? success : error,
                      ),
                    ],
                  ],
                ),
              ),
              // Derecha
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  valueTooltip != null
                      ? Tooltip(
                          message: valueTooltip!,
                          child: DSText.heading2(metricValue),
                        )
                      : DSText.heading2(metricValue),
                  const DSGap.xs(),
                  DSText.labels(metricSubtitle),
                ],
              ),
            ],
          ),

          if (caption != null) ...[
            const DSGap.md(),
            DSText.paragraph(caption!),
          ],
        ],
      ),
    );
  }
}
