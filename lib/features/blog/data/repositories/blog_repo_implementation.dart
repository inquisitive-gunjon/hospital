
import 'package:dartz/dartz.dart';
import 'package:hospital_riverpod/features/blog/data/datasource/blog_remote_data_source.dart';
import 'package:hospital_riverpod/features/blog/domain/models/bloglist_response_model.dart';
import 'package:hospital_riverpod/features/blog/domain/repositories/bloglist_repository.dart';
import 'package:hospital_riverpod/shared/exceptions/http_exception.dart';



class BlogRepositoryImpl extends BlogListRepository{
  final BlogDataSource blogDataSource;
  BlogRepositoryImpl(this.blogDataSource);

  @override
  Future<Either<AppException, BlogListResponseModel>> fetchBlogList({required int skip}) {
    return blogDataSource.fetchPaginatedProducts(skip: skip);
  }

}

