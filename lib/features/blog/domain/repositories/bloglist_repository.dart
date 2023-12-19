import 'package:dartz/dartz.dart';
import 'package:hospital_riverpod/features/blog/domain/models/bloglist_response_model.dart';
import 'package:hospital_riverpod/shared/exceptions/http_exception.dart';




abstract class BlogListRepository {

  Future<Either<AppException, BlogListResponseModel>> fetchBlogList({required int skip});
}