
import 'package:dartz/dartz.dart';
import 'package:hospital_riverpod/features/blog/domain/models/bloglist_response_model.dart';
import 'package:hospital_riverpod/features/blog/domain/repositories/bloglist_repository.dart';
import 'package:hospital_riverpod/features/blog/presentation/providers/state/blog_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../../shared/exceptions/http_exception.dart';

class BlogNotifier extends StateNotifier<BlogState>{

  final BlogListRepository allOrderApiRepository;

  BlogNotifier(this.allOrderApiRepository) : super( const BlogState.initial());

  bool get isFetching => state.state != BlogConcreteState.loading && state.state != BlogConcreteState.fetchingMore;





  Future<void> fetchBlogListData() async {
    if (isFetching && state.state !=  BlogConcreteState.fetchProductDetails) {
      state = state.copyWith(
        state: state.page > 0
            ?  BlogConcreteState.fetchingMore
            :  BlogConcreteState.loading,
        // state: BlogListConcreteState.fetchProductDetails,
        isLoading: true,

      );

      final response = await allOrderApiRepository.fetchBlogList(skip: state.page+1);
      // skip: state.page * PRODUCTS_PER_PAGE);

      updateStateFromResponse(response);
    } else {
      state = state.copyWith(
        state: BlogConcreteState.failure,
        message: 'Have no  more orders available',
        isLoading: false,
        // isinitial: false
      );
    }



    void resetState() {
      state =  BlogState.initial();
    }
  }




  void updateStateFromResponse(
      Either<AppException,  BlogListResponseModel> response) {
    response.fold((failure) {
      state = state.copyWith(
        state: BlogConcreteState.failure,
        message: failure.message,
        isLoading: false,
        // isinitial: false
      );
    }, (blogListData) {

      // state=state.copyWith(
      //   allOrderDetails: data.data,
      //   state: BlogListConcreteState.loaded,
      //   isLoading: false,
      //   message: data.massage,
      // );
      final orderList = blogListData.data!.blogs!.blogDataList;
      final totalOrders = [...?state.blogDataList, ...orderList!];

      state = state.copyWith(
          blogDataList: totalOrders
          ,
          state: totalOrders.length == blogListData.data!.blogs!.total
              ? BlogConcreteState.fetchProductDetails
              : BlogConcreteState.loaded,
          hasData: true,
          message: totalOrders.isEmpty ? 'No products found' : '',
          // page: totalOrders.length ~/ PRODUCTS_PER_PAGE,
          page: blogListData.data!.blogs!.currentPage,
          // total: data.total,
          isLoading: false,
          isinitial: false
        // isinitial: false
      );
    });
  }

}
