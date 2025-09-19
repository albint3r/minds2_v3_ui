import "package:easy_localization/easy_localization.dart";
import "package:flutter/material.dart";
import "package:minds2_ui_v3/core/presentation/design_system/atoms/ds_gap.dart";
import "package:minds2_ui_v3/core/presentation/design_system/atoms/ds_icon.dart";
import "package:minds2_ui_v3/core/presentation/design_system/atoms/ds_profile_avatar.dart";
import "package:minds2_ui_v3/core/presentation/design_system/tokens/color_tokens.dart";
import "package:minds2_ui_v3/gen/assets.gen.dart";

/// Rail lateral de proyectos (logo “S” + “+” + lista de proyectos).
/// - Ancho fijo 64px.
/// - Colores y tipografía del DS.
/// - La lista de proyectos está HARDCODEADA dentro del widget.
class DSProjectRail extends StatelessWidget {
  const DSProjectRail({super.key});

  static const double _railWidth = 64;
  static const double _itemSize = 40;

  // ⚠️ Lista hardcodeada (mock) de proyectos
  List<String> get _projects => const [
    "https://picsum.photos/seed/p1/200",
    "https://picsum.photos/seed/p2/200",
    "https://picsum.photos/seed/p3/200",
    "https://picsum.photos/seed/p4/200",
    "https://picsum.photos/seed/p5/200",
    "https://picsum.photos/seed/p6/200",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _railWidth,
      decoration: BoxDecoration(
        // Fondo oscuro como en el diseño (usa tokens)
        color: DSColors.primary.ink[900],
      ),
      child: Column(
        children: [
          const DSGap.xxl(),
          Assets.images.logo.minds2LogoSymbol.image(height: 35),
          const DSGap.sm(),
          DSIcon.add(
            message: "ds.navRail.toolTips.add".tr(),
            type: DSIconType.surface,
          ),
          const DSGap.xl(),
          // LISTA HARD-CODEADA DE PROYECTOS
          Expanded(
            child: ListView.separated(
              itemCount: _projects.length,
              separatorBuilder: (_, _) => const DSGap.sm(),
              itemBuilder: (context, index) {
                final url = _projects[index];
                return Center(
                  child: SizedBox(
                    width: _itemSize,
                    height: _itemSize,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: DSProfileAvatar(imageUrl: url),
                    ),
                  ),
                );
              },
            ),
          ),

          const DSGap.sm(),
        ],
      ),
    );
  }
}
