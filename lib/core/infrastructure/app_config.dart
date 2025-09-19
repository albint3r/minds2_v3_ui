class AppConfig {
  static bool get isDebug => true;

  static String get scheme => isDebug ? "http" : "https";

  static int get port => isDebug ? 80 : 443;

  static String get apiUrl => isDebug ? "localhost" : "minds2.ai";

  static String get baseUrl => "$scheme://$apiUrl";

  static String get apiBasePath => "/api/v1";

  static String get fullApiUrl => "$baseUrl$apiBasePath";

  static bool get enableLogging => isDebug;

  static bool get sendAnalytics => !isDebug;

  static Duration get connectTimeout => const Duration(seconds: 10);

  static Duration get receiveTimeout => const Duration(seconds: 30);

  static String get environment => isDebug ? "development" : "production";
}
