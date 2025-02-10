// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:vas_app/core/errors/bot_toast.dart' as _i531;
import 'package:vas_app/core/internal/di/register_module.dart' as _i249;
import 'package:vas_app/feature/auth_page/presentation/bloc/auth_bloc.dart'
    as _i892;
import 'package:vas_app/feature/main_page/presentation/bloc/profile_bloc.dart'
    as _i264;
import 'package:vas_app/feature/profile_page/presentation/bloc/profile_bloc.dart'
    as _i731;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i531.BotToastDi>(() => _i531.BotToastDi());
    gh.lazySingleton<_i731.ProfileBloc>(() => _i731.ProfileBloc());
    gh.lazySingleton<_i892.AuthBloc>(() => _i892.AuthBloc());
    gh.lazySingleton<_i264.ProfileBloc>(() => _i264.ProfileBloc());
    gh.lazySingleton<_i361.Dio>(() => registerModule.dio());
    return this;
  }
}

class _$RegisterModule extends _i249.RegisterModule {}
