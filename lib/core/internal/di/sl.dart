import 'dart:async';
import 'dart:io';


import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:vas_app/core/internal/di/sl.config.dart';
import 'package:vas_app/core/internal/reference_wrapper.dart';

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
//     StreamController<RefreshTokenResult>.broadcast();

// Stream<RefreshTokenResult>? refreshTokenStream;

Completer<bool>? refreshCompleter;
// final ReferenceWrapper<JwtTokensModel?>? _token = ReferenceWrapper<JwtTokensModel?>(value: null);

@module
abstract class RegisterModule {
  @lazySingleton
  Dio get dio {
    setupCompleter = Completer<bool>();

    // AuthDataRepositoryImpl authDataRepositoryImpl = AuthDataRepositoryImpl();
    // AppSettingsRepositoryImpl appSettingsRepositoryImpl = AppSettingsRepositoryImpl();
    // EnvironmentDataRepositoryImpl environmentDataRepositoryImpl = EnvironmentDataRepositoryImpl();
    setupCompleter = Completer<bool>();
    // authDataRepositoryImpl.setRefreshTokenResultStream(_refreshTokenStreamController.stream);
    // refreshTokenStream = _refreshTokenStreamController.stream;
    // Dio dio = Dio(
    //   BaseOptions(
    //     baseUrl: environmentDataRepositoryImpl.getServerTypeString(),
    //     connectTimeout: const Duration(milliseconds: 15000),
    //   ),
    // );

    // dio.interceptors.clear();
    // dio.interceptors.add(
    //   // DynamicUrlInterceptor(),
    // );
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
    // dio.interceptors.add(RefreshTokenInterceptor(
    //     token: _token,
    //     refreshToken: refreshToken,
    //     dio: dio,
    //     refreshTokenStatusCallback: (RefreshTokenResult refreshTokenResult) {
    //       _refreshTokenStreamController.add(refreshTokenResult);
    //     }));
    //
    // dio.interceptors.add(MadInspector.network.dioInterceptor());
    // dio.interceptors.add(ErrorInterceptor());

    if (!kReleaseMode) {
      dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
      ));
    }

    if (setupCompleter?.isCompleted == true) return dio;
    setupCompleter?.complete(true);
    return dio;
  }

  // @lazySingleton
  // AuthApi authApi() => AuthApiDioService(dio);
  //
  // @lazySingleton
  // HotelApi breakfastServiceApi() => HotelsApiDioService(dio);
  //
  // @lazySingleton
  // LuggageApi luggageApiDioService() => LuggageApiDioService(dio);
}

// Future<RefreshTokenResult?> refreshToken({bool? forceRefresh}) async {
//   AuthDataRepositoryImpl authDataRepositoryImpl = AuthDataRepositoryImpl();
//
//   await setupComplete();
//   // await refreshComplete();
//   refreshCompleter = Completer<bool>();
//   try {
//     final JwtTokensModel? oAuth2Token = await authDataRepositoryImpl.getTokenAccess();
//
//     if (oAuth2Token == null) {
//       _refreshTokenStreamController.add(RefreshTokenResult.noToken);
//       return RefreshTokenResult.noToken;
//     }
//
//     _token?.value = oAuth2Token;
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
//   final Dio _dio = getIt<Dio>();
//   AuthDataRepositoryImpl authDataRepositoryImpl = AuthDataRepositoryImpl();
//   EnvironmentDataRepositoryImpl environmentDataRepositoryImpl = EnvironmentDataRepositoryImpl();
//
//   //  Dio клиент для запроса обновления токена
//   //TODO поменять при выпуске на дефолтный прод сервер
//   String? serverType = prefs.getString('selectServerString');
//   final Dio client = Dio(BaseOptions(baseUrl: environmentDataRepositoryImpl.getServerTypeString()));
//
//   // Установка заголовков для запроса
//   client.options.headers.addAll(<String, String>{
//     'Authorization': 'Bearer ${token.accessToken}',
//   });
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
//       '/identity-service/api/v1/Auth/RefreshToken',
//       data: SignRefreshRequest((SignRefreshRequestBuilder b) => b..refreshToken = token.refreshToken).toJson(),
//       options: Options(contentType: Headers.jsonContentType),
//     );
//
//     // Обработка ответа
//     final SignResponse? sign = SignResponse.fromJson(res.data!);
//     if (sign != null) {
//       _token?.value = JwtTokensModel(
//         accessToken: sign.accessToken,
//         refreshToken: sign.refreshToken,
//         expiresIn: sign.expiresIn,
//         tokenType: 'Bearer',
//       );
//       authDataRepositoryImpl.saveTokenAccess(_token!.value!);
//     }
//
//     return res.statusCode;
//   } catch (e) {
//     return null;
//   }
// }
//
// Future<bool> logout() async {
//   final Dio dio = getIt<Dio>();
//   final Response<Map<String, dynamic>> res =
//       await dio.post<Map<String, dynamic>>('/identity-service/api/v1/Auth/RefreshToken');
//   // _persist?.clearAll();
//   return res.statusCode == successCode;
// }

Future<bool?> setupComplete() async {
  return setupCompleter?.future;
}
