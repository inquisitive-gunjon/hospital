



import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:hospital_riverpod/configs/app_configs.dart';
import 'package:hospital_riverpod/features/auth/domain/models/logIn_request_model.dart';
import 'package:hospital_riverpod/features/auth/domain/models/logIn_response_model.dart';

import '../../../../../shared/data/remote/network_service.dart';
import '../../../../../shared/exceptions/http_exception.dart';

abstract class AuthUserDataSource {
  Future<Either<AppException, LogInResponseModel>> loginUser({required UserLoginData user});
  // Future<Either<AppException, LogOutResponseModel>> logOutUser();
}


class AuthUserRemoteDataSource implements AuthUserDataSource {

  final NetworkService networkService;
  AuthUserRemoteDataSource(this.networkService);


  /// ---------------------------------------login-------------------------------------------------
  @override
  Future<Either<AppException, LogInResponseModel>> loginUser({required UserLoginData user}) async {
    try {
      final eitherType = await networkService.post(
        AppConfigs.logInPath,
        data: user.toJson(),
      );

      return eitherType.fold(
            (exception) {
          return Left(exception);
        },
            (response) {
          final logInResponseModel = LogInResponseModel.fromJson(response.data);
          // update the token for requests
          networkService.updateHeader(
            token: logInResponseModel.data!.token.toString(),
          );
          log("Check Token ========>");
          log("Check Token ========>");
          log("Check Token ========>${logInResponseModel.data!.token.toString()}");
          log("Check Token ========>");
          log("Check Token ========>");
          return Right(logInResponseModel);
        },



      );
    } catch (e) {
      return Left(
        AppException(
          message: 'Unknown error occured',
          statusCode: 1,
          identifier: '${e.toString()}\nSellerLoginUserRemoteDataSource .loginUser',
        ),
      );
    }
  }


}