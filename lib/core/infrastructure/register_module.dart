import "dart:io";

import "package:dio/dio.dart";
import "package:dio_intercept_to_curl/dio_intercept_to_curl.dart";
import "package:flutter/foundation.dart";
import "package:injectable/injectable.dart";
import "package:l/l.dart";
import "package:minds2_ui_v3/auth/aplication/auth_bloc.dart";
import "package:minds2_ui_v3/auth/domain/i_auth_facade.dart";
import "package:minds2_ui_v3/auth/domain/user.dart";
import "package:minds2_ui_v3/auth/infrasctructure/auth_interceptors.dart";
import "package:minds2_ui_v3/core/infrastructure/app_config.dart";
import "package:shared_preferences/shared_preferences.dart";

@module
abstract class RegisterModule {
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @preResolve
  @singleton
  Future<AuthBloc> authBloc(
    IAuthFacade facade,
    SharedPreferences sharePref,
  ) async {
    // First check the user already have a token in the cookies.
    // If the token in valid it will return the credential and the curr token.
    User? appUser;
    final token = sharePref.getString("token");
    if (token is String && token.isNotEmpty) {
      try {
        appUser = await facade.getMe();
        l.d("App User exist and already connected: ${appUser.name}");
      } catch (e) {
        l.d("User App Don't exist.");
        appUser = null;
      }
    }
    return AuthBloc(facade, appUser: appUser, token: token ?? "");
  }

  @singleton
  Uri getUri() =>
      Uri(scheme: AppConfig.scheme, host: AppConfig.host, port: AppConfig.port);

  @injectable
  BaseOptions getDioBaseOptions(Uri uri) {
    final headers = {HttpHeaders.acceptHeader: Headers.jsonContentType};
    return BaseOptions(
      baseUrl: uri.toString(),
      headers: headers,
      connectTimeout: const Duration(seconds: 45),
      receiveTimeout: const Duration(seconds: 45),
    );
  }

  @injectable
  Iterable<Interceptor> getInterceptors() {
    if (kDebugMode) {
      return [LogInterceptor(logPrint: l.i), DioInterceptToCurl()];
    }
    return [];
  }

  @singleton
  Dio getDio(
    BaseOptions options,
    Iterable<Interceptor> interceptors,
    AuthInterceptors auth,
  ) {
    final dio = Dio(options);
    dio.interceptors
      ..addAll(interceptors)
      ..add(auth)
      ..add(LogInterceptor());
    return dio;
  }

  // @singleton
  // FirebaseAnalytics getAnalytics() => FirebaseAnalytics.instance;
  //
  // @singleton
  // FirebaseAnalyticsObserver getAnalyticsObserver(FirebaseAnalytics analytics) =>
  //     FirebaseAnalyticsObserver(
  //       analytics: analytics,
  //     );
}
