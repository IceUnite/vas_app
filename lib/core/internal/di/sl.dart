import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:vas_app/core/internal/api_constants.dart';
import 'package:vas_app/core/internal/di/sl.config.dart';
import 'package:vas_app/core/repositories/auth_data_repository_impl.dart';
import 'package:vas_app/feature/auth_page/data/api/auth_api.dart';
import 'package:vas_app/feature/auth_page/data/api/service/auth_service_api.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: true,
  asExtension: false,
)
void configureDependencies() => $initGetIt(getIt);
const int successCode = 204;
const String apiVersion = 'v2';
const String apiVersionAuth = 'v1';

Completer<bool>? setupCompleter;
// final StreamController<RefreshTokenResult> _refreshTokenStreamController =
// StreamController<RefreshTokenResult>.broadcast();

Completer<bool>? refreshCompleter;

@module
abstract class RegisterModule {
  @lazySingleton
  Dio get dio {
    AuthDataRepositoryImpl authDataRepositoryImpl = AuthDataRepositoryImpl();
    setupCompleter = Completer<bool>();
    // refreshTokenStream = _refreshTokenStreamController.stream;

    Dio dio = Dio(
      BaseOptions(
        baseUrl: localGatewayServerUrl,
        connectTimeout: const Duration(milliseconds: 15000),

      ),
    );
    // _setupAuthDio();
    // dio = Dio(
    //   BaseOptions(
    //     baseUrl: 'http://0.0.0.0:8000',
    //   ),
    // );
    // dio.interceptors.add(RefreshTokenInterceptor(
    //     token: authDataRepositoryImpl.token,
    //     refreshToken: refreshToken,
    //     dio: dio,
    //     refreshTokenStatusCallback: (RefreshTokenResult refreshTokenResult) {
    //       refreshToken();
    //     }));
    // dio.interceptors.clear();
    // dio.interceptors.add(InterceptorsWrapper(
    //   onRequest: (RequestOptions options, RequestInterceptorHandler? handler) {
    //     options.headers.addAll(<String, dynamic>{
    //       'Time-Zone-Offset': DateTime.now().timeZoneOffset.toServerString(),
    //       'X-Client-Version': appSettingsRepositoryImpl.appVersion,
    //       'X-Client-Build-Number': appSettingsRepositoryImpl.buildNumber,
    //       'User-Agent': appSettingsRepositoryImpl.userAgent,
    //       'Accept-Language': Platform.localeName,
    //     });
    //     return handler?.next(options);
    //   },
    // ));

    // dio.interceptors.add(MadInspector.network.dioInterceptor());
    // dio.interceptors.add(ErrorInterceptor());

    if (!kReleaseMode) {
      dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
      ));
    }
    // if (setupCompleter?.isCompleted == true) return;
    // setupCompleter?.complete(true);
    return dio;
  }

  @lazySingleton
  AuthApi authApi(Dio dio) => AuthApiDioService(dio);

  // @lazySingleton
  // BreakfastApi breakfastServiceApi(Dio dio) => BreakfastOrdersApiDioService(dio);
}

// Future<RefreshTokenResult?> refreshToken({bool? forceRefresh}) async {
//   // await setupComplete();
//   AuthDataRepositoryImpl authDataRepositoryImpl = AuthDataRepositoryImpl();
//
//   // await refreshComplete();
//   refreshCompleter = Completer<bool>();
//   try {
//     final JwtTokensModel? oAuth2Token = await authDataRepositoryImpl.getTokenAccess();
//     print('TOOOOOOKEN ${oAuth2Token?.refreshToken}');
//
//     if (oAuth2Token == null) {
//       _refreshTokenStreamController.add(RefreshTokenResult.noToken);
//       return RefreshTokenResult.noToken;
//     }
//
//     final int currentTimestampSinceEpoch = DateTime.now().millisecondsSinceEpoch;
//     final int expiresInSinceEpoch = oAuth2Token.expiresIn ?? 0 - const Duration(minutes: 1).inMilliseconds;
//
//     if (currentTimestampSinceEpoch > expiresInSinceEpoch || forceRefresh == true) {
//       final int? refreshAccessTokenCode = await requestNewToken(oAuth2Token);
//       if (refreshAccessTokenCode == null) {
//         _refreshTokenStreamController.add(RefreshTokenResult.serverUnavailable);
//         return RefreshTokenResult.serverUnavailable;
//       }
//       if (refreshAccessTokenCode >= 200 && refreshAccessTokenCode < 300) {
//         _refreshTokenStreamController.add(RefreshTokenResult.success);
//         return RefreshTokenResult.success;
//       } else if (refreshAccessTokenCode == 401 || refreshAccessTokenCode == 403) {
//         _refreshTokenStreamController.add(RefreshTokenResult.expired);
//         return RefreshTokenResult.expired;
//       }
//     }
//
//     authDataRepositoryImpl.token.value = oAuth2Token;
//     _refreshTokenStreamController.add(RefreshTokenResult.stillValid);
//     refreshCompleter?.complete(true);
//     return RefreshTokenResult.stillValid;
//   } catch (e) {
//     if (e is DioException) {
//       final int? responseStatusCode = e.response?.statusCode;
//       if (responseStatusCode == 401 || responseStatusCode == 403) {
//         _refreshTokenStreamController.add(RefreshTokenResult.expired);
//         return RefreshTokenResult.expired;
//       }
//       if ((responseStatusCode ?? 0) >= 500 && (responseStatusCode ?? 0) <= 599) {
//         _refreshTokenStreamController.add(RefreshTokenResult.serverUnavailable);
//         return RefreshTokenResult.serverUnavailable;
//       }
//     }
//     refreshCompleter?.complete(false);
//     rethrow;
//   }
// }

// Future<int?> requestNewToken(JwtTokensModel token) async {
//   final Dio _dio = getIt<Dio>(); // Глобальный Dio для логирования/настроек
//   final EnvironmentDataRepositoryImpl environmentDataRepositoryImpl = EnvironmentDataRepositoryImpl();
//   AuthDataRepositoryImpl authDataRepositoryImpl = AuthDataRepositoryImpl();
//   final JwtTokensModel? tokens = await authDataRepositoryImpl.getTokenAccess();
//   print('authDataRepositoryImpl ${tokens?.accessToken}');
//
//   //  Dio клиент для запроса обновления токена
//   final Dio client = Dio(BaseOptions(
//     baseUrl: 'https://gw.test.apeironspace.ru/',
//   ));
//
//   // Установка заголовков для запроса
//   client.options.headers.addAll(<String, String>{
//     'Authorization': 'Bearer ${token.accessToken}',
//   });
//   print('TOKENN:${token.accessToken}');
//
//   // Добавление PrettyDioLogger только в режиме отладки
//   if (!kReleaseMode) {
//     _dio.interceptors
//         .add(PrettyDioLogger(requestHeader: true, requestBody: true, responseHeader: true, responseBody: true));
//   }
//
//   try {
//     // Выполнение запроса на обновление токена
//     final Response<Map<String, dynamic>> res = await client.post<Map<String, dynamic>>(
//       'api/$apiVersionAuth/Auth/RefreshToken',
//       data: SignRefreshRequest((SignRefreshRequestBuilder b) => b..refreshToken = token.refreshToken).toJson(),
//       options: Options(contentType: Headers.jsonContentType),
//     );
//
//     // Обработка ответа
//     final SignResponse? sign = SignResponse.fromJson(res.data!);
//     if (sign != null) {
//       authDataRepositoryImpl.token.value = JwtTokensModel(
//         accessToken: sign.accessToken,
//         refreshToken: sign.refreshToken,
//         expiresIn: sign.expiresIn,
//         tokenType: 'Bearer',
//       );
//     }
//
//     return res.statusCode;
//   } catch (e) {
//     return null;
//   }
// }

Future<bool?> setupComplete() async {
  return setupCompleter?.future;
}
