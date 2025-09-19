import "dart:io";

import "package:dio/dio.dart";
import "package:dio_intercept_to_curl/dio_intercept_to_curl.dart";
import "package:flutter/foundation.dart";
import "package:injectable/injectable.dart";
import "package:l/l.dart";
import "package:minds2_ui_v3/auth/infrasctructure/auth_interceptors.dart";
import "package:minds2_ui_v3/core/infrastructure/app_config.dart";
import "package:shared_preferences/shared_preferences.dart";

@module
abstract class RegisterModule {
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @singleton
  Uri getUri() {
    return Uri(
      scheme: AppConfig.scheme,
      host: AppConfig.apiUrl,
      port: AppConfig.port,
    );
  }

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
