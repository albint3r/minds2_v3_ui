import "package:easy_localization/easy_localization.dart";
import "package:flutter/cupertino.dart";
import "package:flutter_web_plugins/url_strategy.dart";
import "package:get_it/get_it.dart";
import "package:injectable/injectable.dart";
import "package:minds2_ui_v3/injectables.config.dart";

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r"$initGetIt", // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
Future<void> configureDependencies(String env) async {
  usePathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await $initGetIt(getIt, environment: env);
}
