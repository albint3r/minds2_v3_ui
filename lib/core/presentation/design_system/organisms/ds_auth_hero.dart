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
    this.centerImage, // 👈 imagen opcional en el centro
  });

  final String titlePrimary;
  final String titleSecondary;
  final ImageProvider backgroundImage;
  final ImageProvider? centerImage;

  @override
  Widget build(BuildContext context) {
    final g = DSColors.secondary.gradient;
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    const alpha = 0.90;
    final overlayColors = <Color>[
      g[0].withValues(alpha: alpha),
      g[1].withValues(alpha: alpha),
      g[2].withValues(alpha: alpha),
      g[3].withValues(alpha: alpha),
    ];

    return SizedBox(
      width: width / 2,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image(image: backgroundImage, fit: BoxFit.cover),
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: overlayColors,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const DSGap.xl(),
              // Logo arriba a la izquierda
              Padding(
                padding: const EdgeInsets.only(left: DSSpacing.md),
                child: Assets.images.logo.minds2LogoSymbol.image(height: 36),
              ),
              const DSGap.xl(),
              // Títulos
              Center(
                child: DsDualText(
                  primary: titlePrimary,
                  secondary: titleSecondary,
                ),
              ),

              // Imagen central opcional
              if (centerImage != null)
                Expanded(
                  child: Center(
                    child: Image(image: centerImage!, fit: BoxFit.contain),
                  ),
                ),

              // Logo abajo a la derecha
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
