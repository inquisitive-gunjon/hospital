import 'package:dartz/dartz.dart';
import 'package:hospital_riverpod/configs/app_configs.dart';
import 'package:hospital_riverpod/features/blog/domain/models/bloglist_response_model.dart';
import '../../../../../shared/data/remote/network_service.dart';
import '../../../../../shared/exceptions/http_exception.dart';
import '../../../../../shared/globals.dart';


abstract class BlogDataSource{
  Future<Either<AppException, BlogListResponseModel>> fetchPaginatedProducts(
      {required int skip});
}

class BlogRemoteDatasource extends BlogDataSource{
  final NetworkService networkService;
  BlogRemoteDatasource(this.networkService);


  @override
  Future<Either<AppException, BlogListResponseModel>> fetchPaginatedProducts(
      {required int skip}) async {
    final response = await networkService.get(
      AppConfigs.blogList,
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
              identifier: 'fetchPaginatedData',
              statusCode: 0,
              message: 'The data is not in the valid format.',
            ),
          );
        }
        final paginatedResponse = BlogListResponseModel.fromJson(jsonData);
        return Right(paginatedResponse);
      },
    );
  }


}


