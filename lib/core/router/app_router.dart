import "package:flutter/widgets.dart";
import "package:go_router/go_router.dart";
import "package:injectable/injectable.dart";
import "package:l/l.dart"; // 👈 logger
import "package:minds2_ui_v3/auth/aplication/auth_bloc.dart";
import "package:minds2_ui_v3/auth/domain/user.dart";
import "package:minds2_ui_v3/auth/presentation/login/login_page.dart";
import "package:minds2_ui_v3/core/presentation/design_system/design_system_gallery_page.dart";
import "package:minds2_ui_v3/home_project/presentation/home_project_page.dart";

@lazySingleton
class AppRouter {
  AppRouter(this._authBloc)
    : _router = GoRouter(
        initialLocation: "/home-project",
        routes: [
          GoRoute(
            path: "/home-project",
            name: "Home",
            builder: (_, __) => const HomeProjectPage(),
          ),
          GoRoute(
            path: "/gallery",
            name: "gallery",
            builder: (_, __) => const DesignSystemGalleryPage(),
          ),
          GoRoute(
            path: "/login",
            name: "login",
            builder: (_, __) => const LogInPage(),
          ),
          GoRoute(path: "/", redirect: (_, __) => "/login"),
        ],
        redirect: (context, state) {
          final isAuthed = _authBloc.state.appUser is User;
          final loggingIn = state.matchedLocation == "/login";
          final from = state.uri.queryParameters["from"];

          l.d(
            "[GoRouter] redirect check:"
            "\n  - requested : ${state.matchedLocation}"
            "\n  - isAuthed  : $isAuthed"
            "\n  - loggingIn : $loggingIn"
            "\n  - from      : $from",
          );

          if (!isAuthed && !loggingIn) {
            final encoded = Uri.encodeComponent(state.uri.toString());
            l.i("🔒 Not authed → redirect to /login?from=$encoded");
            return "/login?from=$encoded";
          }

          if (isAuthed && loggingIn) {
            final target = from ?? "/home";
            l.i("✅ Authed on /login → redirect to $target");
            return target;
          }

          l.v("➡️ No redirect");
          return null;
        },
        errorBuilder: (_, s) {
          l.e("[GoRouter] error: ${s.error}");
          return Text("Routing error: ${s.error}");
        },
      ) {
    l.i(
      "[AppRouter] initialized "
      "(initialLocation=/gallery, authed=${_authBloc.state.appUser != null})",
    );
  }

  final AuthBloc _authBloc;
  final GoRouter _router;

  GoRouter get router => _router;

  void go(String location) => _router.go(location);

  Future<T?> push<T>(String loc) => _router.push<T>(loc);

  void replace(String loc) => _router.replace(loc);

  void pop<T extends Object?>([T? result]) => _router.pop(result);
}
