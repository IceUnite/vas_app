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

import '../../../feature/auth_page/data/api/auth_api.dart' as _i1031;
import '../../../feature/auth_page/data/api/service/auth_service_api.dart'
    as _i785;
import '../../../feature/auth_page/data/repository/auth_repository_impl.dart'
    as _i458;
import '../../../feature/auth_page/domain/repository/auth_repository.dart'
    as _i472;
import '../../../feature/auth_page/domain/usecases/auth_usecase.dart' as _i199;
import '../../../feature/auth_page/presentation/bloc/auth_bloc.dart' as _i185;
import '../../../feature/history_page/data/api/service/historia_order_service.dart'
    as _i679;
import '../../../feature/history_page/data/repository/historia_order_repository_impl.dart'
    as _i683;
import '../../../feature/history_page/domain/usecases/history_order_usecase.dart'
    as _i968;
import '../../../feature/history_page/presentation/bloc/history_order_bloc.dart'
    as _i288;
import '../../../feature/order_page/data/api/service/order_service_api.dart'
    as _i326;
import '../../../feature/order_page/data/repository/order_reository_impl.dart'
    as _i91;
import '../../../feature/order_page/domain/usecases/order_usecase.dart'
    as _i397;
import '../../../feature/order_page/presentation/bloc/order_bloc.dart' as _i901;
import '../../../feature/profile_page/data/api/profile_order_service_api.dart'
    as _i325;
import '../../../feature/profile_page/data/api/service/profile_order_service.dart'
    as _i950;
import '../../../feature/profile_page/data/repository/profile_order_repository_impl.dart'
    as _i643;
import '../../../feature/profile_page/domain/usecases/profile_usecase.dart'
    as _i976;
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
  gh.lazySingleton<_i1031.AuthApi>(
      () => registerModule.authApi(gh<_i361.Dio>()));
  gh.lazySingleton<_i325.ProfileServiceApi>(
      () => registerModule.provideProfileServiceApi(gh<_i361.Dio>()));
  gh.lazySingleton<_i950.ProfileServiceApiImpl>(
      () => _i950.ProfileServiceApiImpl(gh<_i361.Dio>()));
  gh.lazySingleton<_i326.OrderServiceApi>(
      () => _i326.OrderServiceApi(gh<_i361.Dio>()));
  gh.lazySingleton<_i785.AuthApiDioService>(
      () => _i785.AuthApiDioService(gh<_i361.Dio>()));
  gh.lazySingleton<_i679.HistoryOrderServiceApi>(
      () => _i679.HistoryOrderServiceApi(gh<_i361.Dio>()));
  gh.lazySingleton<_i91.OrdersRepositoryImpl>(() =>
      _i91.OrdersRepositoryImpl(orderServiceApi: gh<_i326.OrderServiceApi>()));
  gh.lazySingleton<_i397.OrdersUseCase>(() =>
      _i397.OrdersUseCase(ordersRepository: gh<_i91.OrdersRepositoryImpl>()));
  gh.lazySingleton<_i683.HistoryOrdersRepositoryImpl>(() =>
      _i683.HistoryOrdersRepositoryImpl(
          historyOrderServiceApi: gh<_i679.HistoryOrderServiceApi>()));
  gh.lazySingleton<_i643.ProfileRepositoryImpl>(() =>
      _i643.ProfileRepositoryImpl(
          profileOrderServiceApi: gh<_i325.ProfileServiceApi>()));
  gh.lazySingleton<_i472.AuthRepository>(() =>
      _i458.AuthRepositoryImpl(authServiceApi: gh<_i785.AuthApiDioService>()));
  gh.lazySingleton<_i901.OrderBloc>(
      () => _i901.OrderBloc(orderUseCase: gh<_i397.OrdersUseCase>()));
  gh.lazySingleton<_i968.HistoryOrdersUseCase>(() => _i968.HistoryOrdersUseCase(
      historyOrdersRepository: gh<_i683.HistoryOrdersRepositoryImpl>()));
  gh.lazySingleton<_i976.ProfileUseCase>(() => _i976.ProfileUseCase(
      profileOrdersRepository: gh<_i643.ProfileRepositoryImpl>()));
  gh.lazySingleton<_i199.AuthUseCase>(
      () => _i199.AuthUseCase(authRepository: gh<_i472.AuthRepository>()));
  gh.lazySingleton<_i1046.ProfileBloc>(
      () => _i1046.ProfileBloc(profileUseCase: gh<_i976.ProfileUseCase>()));
  gh.lazySingleton<_i288.HistoryOrderBloc>(() => _i288.HistoryOrderBloc(
      historyOrdersUseCase: gh<_i968.HistoryOrdersUseCase>()));
  gh.lazySingleton<_i185.AuthBloc>(
      () => _i185.AuthBloc(authUseCase: gh<_i199.AuthUseCase>()));
  return getIt;
}

class _$RegisterModule extends _i581.RegisterModule {}
