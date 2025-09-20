import "package:easy_localization/easy_localization.dart";
import "package:flutter/material.dart";
import "package:minds2_ui_v3/auth/presentation/login/widgets/body_login.dart";
import "package:minds2_ui_v3/core/presentation/design_system/atoms/ds_text.dart";

class LogInPage extends StatelessWidget {
  const LogInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: DSText.heading1("login".tr())),
      body: const BodyLogin(),
    );
  }
}
