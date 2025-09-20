import "package:flutter/material.dart";
import "package:minds2_ui_v3/core/presentation/design_system/atoms/ds_dual_headline.dart";
import "package:minds2_ui_v3/core/presentation/design_system/atoms/ds_gap.dart";
import "package:minds2_ui_v3/core/presentation/design_system/tokens/color_tokens.dart";
import "package:minds2_ui_v3/core/presentation/design_system/tokens/spacing_tokens.dart";
import "package:minds2_ui_v3/gen/assets.gen.dart";

class DSAuthHero extends StatelessWidget {
  const DSAuthHero({
    super.key,
    required this.titlePrimary,
    required this.titleSecondary,
    required this.backgroundImage,
    this.width = 1000,
  });

  final String titlePrimary;
  final String titleSecondary;
  final ImageProvider backgroundImage;
  final double width;

  @override
  Widget build(BuildContext context) {
    final g = DSColors.secondary.gradient;
    final overlayColors = <Color>[
      g[0].withValues(alpha: 0.78),
      g[1].withValues(alpha: 0.62),
      g[2].withValues(alpha: 0.62),
      g[3].withValues(alpha: 0.90),
    ];

    return SizedBox(
      width: width,
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Fondo imagen
          Image(image: backgroundImage, fit: BoxFit.cover),
          // Overlay degradado
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: overlayColors,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),

          // Contenido
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const DSGap.xl(),
              Padding(
                padding: const EdgeInsets.all(DSSpacing.xl),
                child: DsDualText(
                  primary: titlePrimary,
                  secondary: titleSecondary,
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: DSSpacing.xl),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Assets.images.logo.minds2WhiteLogo.image(height: 30),
                ),
              ),
              const DSGap.md(),
            ],
          ),
        ],
      ),
    );
  }
}
