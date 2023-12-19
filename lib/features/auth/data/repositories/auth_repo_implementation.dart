


import 'package:dartz/dartz.dart';
import 'package:hospital_riverpod/features/auth/data/datasource/authentication_remote_data_source.dart';
import 'package:hospital_riverpod/features/auth/domain/models/logIn_request_model.dart';
import 'package:hospital_riverpod/features/auth/domain/models/logIn_response_model.dart';
import 'package:hospital_riverpod/features/auth/domain/repositories/authentication_repository.dart';
import '../../../../../shared/exceptions/http_exception.dart';

class AdminAuthenticationRepositoryImpl extends AuthenticationRepository {
  final AuthUserDataSource dataSource;
  AdminAuthenticationRepositoryImpl(this.dataSource);
  @override
  Future<Either<AppException, LogInResponseModel>> loginUser({required UserLoginData user}) {
    return dataSource.loginUser(user: user);
  }


}