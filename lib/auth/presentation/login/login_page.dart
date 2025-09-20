import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:minds2_ui_v3/auth/aplication/auth_bloc.dart";
import "package:minds2_ui_v3/auth/presentation/login/widgets/body_login.dart";

class LogInPage extends StatelessWidget {
  const LogInPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<AuthBloc>().add(const AuthEvent.startLogIn());
    return const Scaffold(body: BodyLogin());
  }
}
