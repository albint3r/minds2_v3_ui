// lib/core/presentation/design_system/components/ds_gap.dart
import "package:gap/gap.dart";
import "package:minds2_ui_v3/core/presentation/design_system/tokens/spacing_tokens.dart";

class DSGap extends Gap {
  const DSGap.xs({super.key}) : super(DSSpacing.xs);

  const DSGap.sm({super.key}) : super(DSSpacing.sm);

  const DSGap.md({super.key}) : super(DSSpacing.md);

  const DSGap.lg({super.key}) : super(DSSpacing.lg);

  const DSGap.xl({super.key}) : super(DSSpacing.xl);

  const DSGap.xxl({super.key}) : super(DSSpacing.xxl);
}
