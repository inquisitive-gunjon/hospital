


import 'package:dartz/dartz.dart';
import 'package:hospital_riverpod/features/auth/domain/models/logIn_request_model.dart';
import 'package:hospital_riverpod/features/auth/domain/models/logIn_response_model.dart';

import '../../../../../shared/exceptions/http_exception.dart';

abstract class AuthenticationRepository {
  Future<Either<AppException, LogInResponseModel>> loginUser({required UserLoginData user});
  // Future<Either<AppException, LogOutResponseModel>> logOutUser();
}