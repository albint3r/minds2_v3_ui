import "package:go_router/go_router.dart";
import "package:minds2_ui_v3/auth/aplication/auth_controller.dart";

GoRouter buildRouter(AuthController auth) {
  return GoRouter(
    refreshListenable: auth,
    initialLocation: "/",
    routes: [],
    redirect: (context, state) {
      final loggingIn = state.matchedLocation == "/login";
      final isAuthed = auth.status == AuthStatus.authenticated;

      if (!isAuthed && !loggingIn) {
        final from = Uri.encodeComponent(state.uri.toString());
        return "/login?from=$from";
      }

      if (isAuthed && loggingIn) {
        return state.uri.queryParameters["from"] ?? "/home";
      }

      return null;
    },
  );
}
