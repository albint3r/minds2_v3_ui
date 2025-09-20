// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter/material.dart' as _i409;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import 'auth/aplication/auth_bloc.dart' as _i979;
import 'auth/domain/i_auth_data_source.dart' as _i253;
import 'auth/domain/i_auth_facade.dart' as _i388;
import 'auth/infrasctructure/auth_data_source_impl.dart' as _i513;
import 'auth/infrasctructure/auth_facade_impl.dart' as _i250;
import 'auth/infrasctructure/auth_interceptors.dart' as _i615;
import 'core/infrastructure/app_bloc_observer.dart' as _i610;
import 'core/infrastructure/register_module.dart' as _i658;
import 'core/infrastructure/shared_pref.dart' as _i41;
import 'core/presentation/design_system/theme/theme_config.dart' as _i689;
import 'core/router/app_router.dart' as _i110;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i174.GetIt> $initGetIt(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i526.GetItHelper(getIt, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  await gh.factoryAsync<_i460.SharedPreferences>(
    () => registerModule.prefs,
    preResolve: true,
  );
  gh.factory<Iterable<_i361.Interceptor>>(
    () => registerModule.getInterceptors(),
  );
  gh.singleton<Uri>(() => registerModule.getUri());
  gh.singleton<_i689.ThemeConfig>(() => _i689.ThemeConfig());
  gh.lazySingleton<_i41.SharedPref>(
    () => _i41.SharedPref(gh<_i460.SharedPreferences>()),
  );
  gh.factory<_i615.AuthInterceptors>(
    () => _i615.AuthInterceptors(gh<_i41.SharedPref>()),
  );
  gh.factoryParam<
    _i610.AppBlocObserver,
    _i409.GlobalKey<_i409.ScaffoldMessengerState>?,
    dynamic
  >((_messenger, _) => _i610.AppBlocObserver(_messenger));
  gh.factory<_i361.BaseOptions>(
    () => registerModule.getDioBaseOptions(gh<Uri>()),
  );
  gh.singleton<_i361.Dio>(
    () => registerModule.getDio(
      gh<_i361.BaseOptions>(),
      gh<Iterable<_i361.Interceptor>>(),
      gh<_i615.AuthInterceptors>(),
    ),
  );
  gh.factory<_i253.IAuthDataSource>(
    () => _i513.AuthDataSourceImpl(gh<_i361.Dio>()),
  );
  gh.factory<_i388.IAuthFacade>(
    () => _i250.AuthFacadeImpl(
      gh<_i253.IAuthDataSource>(),
      gh<_i41.SharedPref>(),
    ),
  );
  await gh.singletonAsync<_i979.AuthBloc>(
    () => registerModule.authBloc(
      gh<_i388.IAuthFacade>(),
      gh<_i460.SharedPreferences>(),
    ),
    preResolve: true,
  );
  gh.lazySingleton<_i110.AppRouter>(
    () => _i110.AppRouter(gh<_i979.AuthBloc>()),
  );
  return getIt;
}

class _$RegisterModule extends _i658.RegisterModule {}
