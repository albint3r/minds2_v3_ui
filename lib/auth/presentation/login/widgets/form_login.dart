import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:minds2_ui_v3/auth/aplication/auth_bloc.dart";
import "package:minds2_ui_v3/core/presentation/design_system/atoms/ds_button.dart";
import "package:minds2_ui_v3/core/presentation/design_system/molecules/fields/ds_text_field.dart";
import "package:minds2_ui_v3/core/presentation/design_system/organisms/forms/ds_form_auth.dart";
import "package:reactive_forms/reactive_forms.dart";

class FormLogin extends StatelessWidget {
  const FormLogin({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthBloc>().state;
    final formGroup = auth.formGroup;
    if (auth.isLoading || formGroup == null) {
      return const CircularProgressIndicator();
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        DSFormAuth(
          formGroup: formGroup!,
          fields: const [
            DSTextField(label: "Email", formControlName: "email"),
            DSTextField(label: "Password", formControlName: "password"),
            MySubmitButton(),
          ],
        ),
      ],
    );
  }
}

class MySubmitButton extends StatelessWidget {
  const MySubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    final form = ReactiveForm.of(context);
    return DSButton.primary(
      label: "LogIn",
      onPressed: form!.valid
          ? () => context.read<AuthBloc>().add(const AuthEvent.logIn())
          : null,
    );
  }
}
