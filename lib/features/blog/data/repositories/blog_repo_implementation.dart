
import 'package:dartz/dartz.dart';
import 'package:hospital_riverpod/features/blog/data/datasource/blog_remote_data_source.dart';
import 'package:hospital_riverpod/features/blog/domain/models/request/blog_data_request_model.dart';
import 'package:hospital_riverpod/features/blog/domain/models/response/bloglist_response_model.dart';
import 'package:hospital_riverpod/features/blog/domain/repositories/bloglist_repository.dart';
import 'package:hospital_riverpod/shared/exceptions/http_exception.dart';



class BlogRepositoryImpl extends BlogRepository{
  final BlogDataSource blogDataSource;
  BlogRepositoryImpl(this.blogDataSource);

  @override
  Future<Either<AppException, BlogResponseModel>> fetchBlogList({required int skip}) {
    return blogDataSource.fetchBlogList(skip: skip);
  }

  @override
  Future<Either<AppException, BlogResponseModel>> deleteBlogData({required String blogId}) {
    // TODO: implement deleteBlogData
    throw UnimplementedError();
  }

  @override
  Future<Either<AppException, BlogResponseModel>> storeBlogData({required BlogDataRequestModel blogDataRequestModel}) {
    // TODO: implement storeBlogData
    throw UnimplementedError();
  }

  @override
  Future<Either<AppException, BlogResponseModel>> updateBlogData({required String blogId, required BlogDataRequestModel blogDataRequestModel}) {
    // TODO: implement updateBlogData
    throw UnimplementedError();
  }


}

