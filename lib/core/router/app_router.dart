import "package:flutter/widgets.dart";
import "package:go_router/go_router.dart";
import "package:injectable/injectable.dart";
import "package:l/l.dart";
import "package:minds2_ui_v3/auth/infrasctructure/auth_controller.dart";
import "package:minds2_ui_v3/auth/presentation/login/login_page.dart";
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
        // ✅ la URL que pediste
        GoRoute(
          path: "/login",
          name: "login",
          builder: (_, __) => const LogInPage(),
        ),

        // root → /gallery (ajústalo a /home si quieres para la app completa)
        GoRoute(path: "/", redirect: (_, __) => "/login"),

        // Ejemplos (descomenta cuando tengas páginas):
        // GoRoute(path: '/login', builder: (_, __) => const LoginPage()),
        // GoRoute(path: '/home',  builder: (_, __) => const HomePage()),
      ],
      redirect: (context, state) {
        final loggingIn = state.matchedLocation == "/login";
        final isAuthed = _auth.status == AuthStatus.authenticated;
        final from = state.uri.queryParameters["from"];

        l.d("[GoRouter] redirect check:");
        l.d(" - requested: ${state.matchedLocation}");
        l.d(" - isAuthed: $isAuthed");
        l.d(" - loggingIn: $loggingIn");
        l.d(" - from param: $from");

        // si no está logueado y no va a login → mándalo a login
        if (!isAuthed && !loggingIn) {
          final encoded = Uri.encodeComponent(state.uri.toString());
          l.d("🔒 Redirecting to /login?from=$encoded");
          return "/login?from=$encoded";
        }

        // si ya está logueado pero está en login → mándalo a home o from
        if (isAuthed && loggingIn) {
          final target = from ?? "/home";
          l.d("✅ Authenticated. Redirecting to $target");
          return target;
        }

        l.d("➡️ No redirect");
        return null;
      },
      errorBuilder: (_, s) => Text("Routing error: ${s.error}"),
    );
  }

  final AuthController _auth;
  late final GoRouter _router;

  GoRouter get router => _router;
}
