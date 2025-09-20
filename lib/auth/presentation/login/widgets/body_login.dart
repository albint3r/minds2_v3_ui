import "package:flutter/material.dart";
import "package:minds2_ui_v3/core/presentation/design_system/organisms/ds_auth_hero.dart"
    show DSAuthHero;
import "package:minds2_ui_v3/gen/assets.gen.dart";

class BodyLogin extends StatelessWidget {
  const BodyLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        DSAuthHero(
          backgroundImage: Assets.images.auth.robotTest.provider(),
          titlePrimary: "Welcome",
          titleSecondary: "Back",
        ),
      ],
    );
  }
}
