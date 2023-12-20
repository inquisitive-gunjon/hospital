import 'package:dartz/dartz.dart';
import 'package:hospital_riverpod/features/blog/domain/models/request/blog_data_request_model.dart';
import 'package:hospital_riverpod/features/blog/domain/models/response/bloglist_response_model.dart';
import 'package:hospital_riverpod/shared/exceptions/http_exception.dart';




abstract class BlogRepository {

  Future<Either<AppException, BlogResponseModel>> fetchBlogList({required int skip});
  Future<Either<AppException, BlogResponseModel>> storeBlogData({required BlogDataRequestModel blogDataRequestModel});
  Future<Either<AppException, BlogResponseModel>> updateBlogData({required String blogId,required BlogDataRequestModel blogDataRequestModel});
  Future<Either<AppException, BlogResponseModel>> deleteBlogData({required String blogId});
}