import "package:flutter/widgets.dart";
import "package:go_router/go_router.dart";
import "package:injectable/injectable.dart";
import "package:l/l.dart";
import "package:minds2_ui_v3/auth/infrasctructure/auth_controller.dart";
import "package:minds2_ui_v3/core/presentation/design_system/design_system_gallery_page.dart";

@lazySingleton
class AppRouter {
  AppRouter(this._auth) {
    _router = GoRouter(
      refreshListenable: _auth,
      // si es para el DS, puedes arrancar directo en /gallery
      initialLocation: "/gallery",
      routes: <RouteBase>[
        // ✅ la URL que pediste
        GoRoute(
          path: "/gallery",
          name: "gallery",
          builder: (_, __) => const DesignSystemGalleryPage(),
        ),

        // root → /gallery (ajústalo a /home si quieres para la app completa)
        GoRoute(path: "/", redirect: (_, __) => "/gallery"),

        // Ejemplos (descomenta cuando tengas páginas):
        // GoRoute(path: '/login', builder: (_, __) => const LoginPage()),
        // GoRoute(path: '/home',  builder: (_, __) => const HomePage()),
      ],
      redirect: (context, state) {
        // 🔓 deja pasar /gallery (y / que redirige a /gallery) sin auth
        l.i("-----> [redirect] $state");
        l.i("-----> [_auth] ${_auth.status}");

        if (state.matchedLocation.startsWith("/gallery") ||
            state.matchedLocation == "/") {
          return null;
        }

        final loggingIn = state.matchedLocation == "/login";
        final isAuthed = _auth.status == AuthStatus.authenticated;

        if (!isAuthed && !loggingIn) {
          final from = Uri.encodeComponent(state.uri.toString());
          return "/login?from=$from";
        }
        if (isAuthed && loggingIn) {
          return state.uri.queryParameters["from"] ?? "/home";
        }
        return null;
      },
      errorBuilder: (_, s) => Text("Routing error: ${s.error}"),
    );
  }

  final AuthController _auth;
  late final GoRouter _router;

  GoRouter get router => _router;
}
