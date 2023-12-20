import 'package:dartz/dartz.dart';
import 'package:hospital_riverpod/configs/app_configs.dart';
import 'package:hospital_riverpod/features/blog/domain/models/request/blog_data_request_model.dart';
import 'package:hospital_riverpod/features/blog/domain/models/response/bloglist_response_model.dart';
import '../../../../../shared/data/remote/network_service.dart';
import '../../../../../shared/exceptions/http_exception.dart';
import '../../../../../shared/globals.dart';


abstract class BlogDataSource{
  Future<Either<AppException, BlogResponseModel>> fetchBlogList({required int skip});
  Future<Either<AppException, BlogResponseModel>> storeBlogData({required BlogDataRequestModel blogDataRequestModel});
  Future<Either<AppException, BlogResponseModel>> updateBlogData({required String blogId,required BlogDataRequestModel blogDataRequestModel});
  Future<Either<AppException, BlogResponseModel>> deleteBlogData({required String blogId});
}

class BlogRemoteDatasource extends BlogDataSource{
  final NetworkService networkService;
  BlogRemoteDatasource(this.networkService);


  @override
  Future<Either<AppException, BlogResponseModel>> fetchBlogList({required int skip}) async {
    final response = await networkService.get(
      AppConfigs.blogListPath,
    );

    return response.fold(
          (l) => Left(l),
          (r) {
        final jsonData = r.data;
        if (jsonData == null) {
          return Left(
            AppException(
              identifier: 'fetchBlogList',
              statusCode: 0,
              message: 'The data is not in the valid format.',
            ),
          );
        }
        final paginatedResponse = BlogResponseModel.fromJson(jsonData);
        return Right(paginatedResponse);
      },
    );
  }

  @override
  Future<Either<AppException, BlogResponseModel>> deleteBlogData({required String blogId}) async{
    // TODO: implement deleteBlogData
    final response = await networkService.delete(
      AppConfigs.blogDeletePath+blogId,
      // queryParameters: {
      //   'skip': skip,
      //   'limit': PRODUCTS_PER_PAGE,
      // },
      // queryParameters: {
      //   'page': skip,
      // },
    );

    return response.fold(
          (l) => Left(l),
          (r) {
                final jsonData = r.data;
                if (jsonData == null) {
                  return Left(
                    AppException(
                      identifier: 'deleteBlogData',
                      statusCode: 0,
                      message: 'The data is not in the valid format.',
                    ),
                  );
                }
                final paginatedResponse = BlogResponseModel.fromJson(jsonData);
                return Right(paginatedResponse);
              },
    );
  }

  @override
  Future<Either<AppException, BlogResponseModel>> storeBlogData({required BlogDataRequestModel blogDataRequestModel}) async{
    final response = await networkService.post(
      AppConfigs.blogStorePath,
      data: blogDataRequestModel.toJson()
    );

    return response.fold(
          (l) => Left(l),
          (r) {
                final jsonData = r.data;
                if (jsonData == null) {
                  return Left(
                    AppException(
                      identifier: 'storeBlogData',
                      statusCode: 0,
                      message: 'The data is not in the valid format.',
                    ),
                  );
                }
                final paginatedResponse = BlogResponseModel.fromJson(jsonData);
                return Right(paginatedResponse);
              },
    );
  }

  @override
  Future<Either<AppException, BlogResponseModel>> updateBlogData({required String blogId, required BlogDataRequestModel blogDataRequestModel}) async{
    final response = await networkService.post(
        AppConfigs.blogUpdatePath+blogId,
        data: blogDataRequestModel.toJson()
    );

    return response.fold(
          (l) => Left(l),
          (r) {
                final jsonData = r.data;
                if (jsonData == null) {
                  return Left(
                    AppException(
                      identifier: 'updateBlogData',
                      statusCode: 0,
                      message: 'The data is not in the valid format.',
                    ),
                  );
                }
                final paginatedResponse = BlogResponseModel.fromJson(jsonData);
                return Right(paginatedResponse);
              },
    );
  }


}


