import 'package:dartz/dartz.dart';
import 'package:hospital_riverpod/shared/domain/models/response.dart';
import 'package:hospital_riverpod/shared/exceptions/http_exception.dart';

abstract class NetworkService {
  String get baseUrl;

  Map<String, Object> get headers;

  void updateHeader({required String token});

  Future<Either<AppException, Response>> get(
      String endpoint, {
        Map<String, dynamic>? queryParameters,
      });

  Future<Either<AppException, Response>> post(
      String endpoint, {
        Map<String, dynamic>? data,
      });

}