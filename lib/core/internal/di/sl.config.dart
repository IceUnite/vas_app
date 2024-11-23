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

import '../../../feature/auth_page/presentation/bloc/auth_bloc.dart' as _i185;
import '../../../feature/main_page/presentation/bloc/profile_bloc.dart'
    as _i1013;
import '../../../feature/profile_page/presentation/bloc/profile_bloc.dart'
    as _i1046;
import '../../errors/bot_toast.dart' as _i959;
import 'sl.dart' as _i581;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt $initGetIt(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  gh.lazySingleton<_i361.Dio>(() => registerModule.dio);
  gh.lazySingleton<_i959.BotToastDi>(() => _i959.BotToastDi());
  gh.lazySingleton<_i1046.ProfileBloc>(() => _i1046.ProfileBloc());
  gh.lazySingleton<_i185.AuthBloc>(() => _i185.AuthBloc());
  gh.lazySingleton<_i1013.ProfileBloc>(() => _i1013.ProfileBloc());
  return getIt;
}

class _$RegisterModule extends _i581.RegisterModule {}
