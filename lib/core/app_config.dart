class AppConfig {
  static bool get isDebug => true;

  static String get protocol => isDebug ? "http" : "https";

  static String get apiUrl => isDebug ? "localhost" : "minds2.ai";

  static int get port => isDebug ? 3000 : 443;

  static String get baseUrl =>
      isDebug ? "$protocol://$apiUrl:$port" : "$protocol://$apiUrl";

  static String get apiBasePath => "/api/v1";

  static String get fullApiUrl => "$baseUrl$apiBasePath";

  static bool get enableLogging => isDebug;

  static bool get sendAnalytics => !isDebug;

  static Duration get connectTimeout => const Duration(seconds: 10);

  static Duration get receiveTimeout => const Duration(seconds: 30);

  static String get environment => isDebug ? "development" : "production";

}
