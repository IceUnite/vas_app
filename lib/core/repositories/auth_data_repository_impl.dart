import 'dart:async';

import 'package:vas_app/core/repositories/auth_data_repository.dart';
import 'package:vas_app/core/utils/shared_preference.dart';
import 'package:vas_app/main.dart';


class AuthDataRepositoryImpl implements AuthDataRepository {
  SharedPrefsRawProvider sharedPrefsRawProvider = SharedPrefsRawProvider(prefs);
  // Stream<RefreshTokenResult>? _streamRefreshTokenResult;

  @override
  Future<void> deleteTokenAccess() {
    // TODO: implement deleteTokenAccess
    throw UnimplementedError();
  }

  // @override
  // Future<JwtTokensModel?> getTokenAccess() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   final jsonString = prefs.getString(SharedKeyWords.jwtTokensModelDTOKey);
  //   if (jsonString == null) return null;
  //   final data = JwtTokensModel.fromJsonka(jsonDecode(jsonString));
  //   _jwtTokensModel = data;
  //   return JwtTokensModel.fromJsonka(jsonDecode(jsonString));
  // }

  // @override
  // void saveTokenAccess(JwtTokensModel jwtTokensDTOModel) {
  //   token.value = jwtTokensDTOModel;
  //   final jsonString = jsonEncode(jwtTokensDTOModel.toJson());
  //   _jwtTokensModel = token.value;
  //   sharedPrefsRawProvider.setString(SharedKeyWords.jwtTokensModelDTOKey, jsonString);
  // }

  // @override
  // Future<JwtTokensModel> updateTokenAccess(JwtTokensModel jwtTokensDTOModel) {
  //   // TODO: implement updateTokenAccess
  //   throw UnimplementedError();
  // }
  //
  // void setRefreshTokenResultStream(Stream<RefreshTokenResult> streamRefreshTokenResult) {
  //   _streamRefreshTokenResult = streamRefreshTokenResult;
  // }
  //
  // @override
  // ReferenceWrapper<JwtTokensModel?> get token => ReferenceWrapper<JwtTokensModel?>(value: jwtTokensModels);
  //
  // @override
  // // TODO: implement refreshTokenStream
  // Stream<RefreshTokenResult>? get refreshTokenStream => _streamRefreshTokenResult;
  //
  // @override
  // JwtTokensModel? get jwtTokensModels => _jwtTokensModel;
}
