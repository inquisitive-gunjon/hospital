import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hospital_riverpod/features/blog/domain/models/bloglist_response_model.dart';

// import '../../../../../products/domain/models/ProductListModel.dart';
// import '../../../../domain/model/all_orders_model.dart';
// import '../../../domain/models/all_orders_model.dart';

enum BlogConcreteState{
  initial,
  loading,
  loaded,
  failure,
  fetchingMore,
  fetchProductDetails

}
@freezed
class BlogState extends Equatable {
  final Data? data;
  final List<BlogModelData>? blogDataList;
  final bool hasData;
  final int page;
  final BlogConcreteState state;
  final String message;
  final bool isLoading;
  final bool isinitial;

  BlogState({
    this.data,
    this.blogDataList = const [],
    this.isLoading = false,
    this.isinitial =true,
    this.page = 0,
    this.hasData = false,
    this.state = BlogConcreteState.initial,
    this.message = '',

  });
  const BlogState.initial({
    this.data,
    this.blogDataList = const [],
    this.isLoading = false,
    this.isinitial =true,
    this.page = 0,
    this.hasData = false,
    this.state = BlogConcreteState.initial,
    this.message = '',
  });

  BlogState copyWith({
    final Data? allOrderDetails,
    final List<BlogModelData>? blogDataList,
    bool? hasData,
    int? page,
    BlogConcreteState? state,
    String? message,
    bool? isLoading,
    bool? isinitial,
  }) {
    return BlogState(
      isLoading: isLoading ?? this.isLoading,
      isinitial: isinitial ?? this.isinitial,
      data: allOrderDetails?? this.data,
      blogDataList: blogDataList ?? this.blogDataList,
      page: page ?? this.page,
      hasData: hasData ?? this.hasData,
      state: state ?? this.state,
      message: message ?? this.message,
    );
  }


  @override
  String toString() {
    return 'DashboardState('
        'isLoading:$isLoading,'
        'isInitial:$isinitial,'
        'orderLength: ${blogDataList!.length},'
        ' page: $page,'
        'hasData: $hasData, '
        'state: $state, message: $message)';
  }

  @override
  List<Object?> get props => [data,blogDataList,page,hasData, state, message];

}