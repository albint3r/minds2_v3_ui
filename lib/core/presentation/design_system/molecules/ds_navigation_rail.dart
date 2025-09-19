import "package:easy_localization/easy_localization.dart";
import "package:flutter/material.dart";
import "package:minds2_ui_v3/core/presentation/design_system/atoms/ds_gap.dart";
import "package:minds2_ui_v3/core/presentation/design_system/atoms/ds_icon.dart";
import "package:minds2_ui_v3/core/presentation/design_system/atoms/ds_logo_animated.dart";
import "package:minds2_ui_v3/core/presentation/design_system/atoms/ds_profile_avatar.dart";
import "package:minds2_ui_v3/core/presentation/design_system/tokens/color_tokens.dart";

/// Rail lateral de proyectos (logo “S” + “+” + lista de proyectos).
/// - Ancho fijo 64px.
/// - Colores y tipografía del DS.
/// - La lista de proyectos está HARDCODEADA dentro del widget.
class DSProjectRail extends StatelessWidget {
  const DSProjectRail({super.key, this.onLogoTap});

  static const double _railWidth = 64;
  static const double _itemSize = 40;
  final VoidCallback? onLogoTap;

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
          DSLogoAnimated(
            onToggle: onLogoTap,
            tooltip: "ds.navRail.toolTips.logoRail".tr(),
          ),
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
              separatorBuilder: (_, __) => const DSGap.sm(),
              itemBuilder: (context, index) {
                final url = _projects[index];
                final bool isSelected = index == 0;

                return Center(
                  child: Container(
                    width: _itemSize,
                    height: _itemSize,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: isSelected
                          ? Border.all(
                        color: DSColors.alert.success[500]!,
                        width: 2.5,
                      )
                          : null,
                    ),
                    child: ClipOval(
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
