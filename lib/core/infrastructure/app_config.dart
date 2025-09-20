import "dart:ui";

class AppConfig {
  static bool get isDebug => true;

  static String get scheme => isDebug ? "http" : "https";

  static int get port => isDebug ? 80 : 443;

  static String get host => isDebug ? "localhost" : "minds2.ai";

  static String get baseUrl => "$scheme://$host";

  static String get path => "/v3";

  static String get fullApiUrl => "$baseUrl$path";

  static bool get enableLogging => isDebug;

  static bool get sendAnalytics => !isDebug;

  static Duration get connectTimeout => const Duration(seconds: 10);

  static Duration get receiveTimeout => const Duration(seconds: 30);

  static String get environment => isDebug ? "development" : "production";

  static List<Locale> get supportedLocales => [
    const Locale("en", "US"),
    const Locale("es", "MX"),
  ];
  static Locale fallbackLocale = supportedLocales.first;
  static String translationPath = "assets/translations";

  static String get devToken =>
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3NTg0MTM3ODUsImlhdCI6MTc1ODMyNzM4NSwic3ViIjp7InVzZXJfaWQiOiJlZDA2NzU3ZC0zN2RkLTQwZmYtYTM1MS0yNDcxYmY0ODdmMjgiLCJlbWFpbCI6ImFsYmludDNyQGdtYWlsLmNvbSJ9fQ.nzBbXqUlIvPb58jpBZkzZJq_XwUR4HD9tYmDvTWx4_o";
}
