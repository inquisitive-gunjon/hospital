import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hospital_riverpod/shared/data/local/shared_prefs_storage_service.dart';
import 'package:hospital_riverpod/shared/data/local/storage_service.dart';
import 'package:hospital_riverpod/shared/globals.dart';
import 'package:flutter/foundation.dart';
import 'package:hospital_riverpod/configs/app_configs.dart';
import 'package:hospital_riverpod/shared/data/remote/network_service.dart';
import 'package:hospital_riverpod/shared/domain/models/response.dart' as response;
import 'package:hospital_riverpod/shared/exceptions/http_exception.dart';
import 'package:hospital_riverpod/shared/mixins/exception_handler_mixin.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DioNetworkService extends NetworkService with ExceptionHandlerMixin {
  final Dio dio;
  DioNetworkService(this.dio) {
    // this throws error while running test
    dio.httpClientAdapter;
    dio.options = dioBaseOptions;
    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true,requestHeader: true,responseHeader: true));
    // if (!kTestMode) {
    //   dio.options = dioBaseOptions;
    //   if (kDebugMode) {
    //     dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true,requestHeader: true));
    //   }
    // }
  }

  bool tokenHasExpired(String? token) {
    if (token == null) return true;
    return JwtDecoder.isExpired(token);
  }
  /// Tries to get accessToken from [AppConfig], localSecureStorage or Keycloak
  /// servers, and update them if necessary
  Future<void> get loadAccessToken async {
    // get token from cache
    String? accessToken = AppConfigs.accessToken;
    if (accessToken != null) {// && !tokenHasExpired(accessToken)) {
      // return accessToken;
    }
    // get token from secure storage
    // Obtain shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();


    // sharedPrefsService.init();
    accessToken = prefs.getString("token");
    log("check token from dio network service============>$accessToken");
    log("check token from dio network service============>$accessToken");
    log("check token from dio network service============>$accessToken");
    if (accessToken != null ) {//&& !tokenHasExpired(accessToken)) {
      // update cache
      AppConfigs.accessToken = accessToken;
      // return accessToken;
    }
    /// get token from Keycloak server
    // final keycloakTokenResponse = await _accessTokenFromKeycloakServer;
    // accessToken = keycloakTokenResponse.accessToken;
    // final refreshToken = keycloakTokenResponse.refreshToken;
    // if (!tokenHasExpired(accessToken) && !tokenHasExpired(refreshToken)) {
    //   // update secure storage
    //   await Future.wait([
    //     LocalSecureStorageRepository.update(
    //       SecureStorageKeys.accessToken,
    //       accessToken,
    //     ),
    //     LocalSecureStorageRepository.update(
    //       SecureStorageKeys.refreshToken,
    //       refreshToken,
    //     )
    //   ]);
    //   // update cache
    //   _config.accessToken = accessToken;
    //   return accessToken;
    // }
    // return accessToken!;
  }

  @override
  void updateHeader({required String token}) {
    // countryCode = countryCode == null ? this.countryCode == 'US' ? 'en': this.countryCode.toLowerCase(): countryCode == 'US' ? 'en' : countryCode.toLowerCase();

    globalToken=token;
    if(kDebugMode){
      print('===Token====>$token');
    }
    dio.options.headers.addAll({'authorization': 'Bearer ${token}'});
    log("check update headers======> ${dio.options.headers}");
    log("check update headers======> ${dio.options.headers}");
    log("check update headers======> ${dio.options.headers}");
  }

  BaseOptions get dioBaseOptions => BaseOptions(
    baseUrl: baseUrl,
    headers: headers,
    connectTimeout: const Duration(seconds: 60),
    receiveTimeout: const Duration(seconds: 60),
  );


  @override
  String get baseUrl => AppConfigs.baseUrl;

  @override
  Map<String, Object> get headers{
    loadAccessToken;
    log("check token from headers=============>${loadAccessToken.toString()}");
    return {
      'accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${AppConfigs.accessToken}',
      //AppConstants.LANG_KEY : countryCode == 'US'? 'en':countryCode.toLowerCase(),
    };
  }



  @override
  Future<Either<AppException, response.Response>> post(String endpoint, {Map<String, dynamic>? data}) {
    final res = handleException(
          () => dio.post(
        endpoint,
        data: data,
      ),
      endpoint: endpoint,
    );
    return res;
  }

  @override
  Future<Either<AppException, response.Response>> get(String endpoint, {Map<String, dynamic>? queryParameters}) {
    final res = handleException(
          () => dio.get(
        endpoint,
        queryParameters: queryParameters,
      ),
      endpoint: endpoint,
    );
    return res;
  }
}